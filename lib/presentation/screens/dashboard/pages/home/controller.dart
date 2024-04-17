// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketbook/services/category_service.dart';
import 'package:pocketbook/utils/secrets.dart';
import 'package:pocketbook/utils/show_snackbar.dart';
import '../../../../../models/transaction.dart';
import '../../../../../services/transaction_service.dart';

class HomePageController extends ChangeNotifier {
  HomePageController(this._transactionService, this._categoryService) {
    _transactionSubscription = _transactionService.listen((_) async {
      load();
    });
  }

  final TransactionService _transactionService;
  final CategoryService _categoryService;

  bool _isLoading = true;
  double _currentDayExpense = 0.0;
  double _currentMonthExpense = 0.0;
  double _monthlyAverage = 0.0;

  List<Transaction> _recentTransactions = [];
  late StreamSubscription _transactionSubscription;

  bool get isLoading => _isLoading;
  bool get isEmpty => _recentTransactions.isEmpty;
  double get currentDayExpense => _currentDayExpense;
  double get currentMonthExpense => _currentMonthExpense;
  double get monthlyAverage => _monthlyAverage;
  List<Transaction> get recentTransactions =>
      UnmodifiableListView(_recentTransactions);

  Future<void> scanBill(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    final imageBytes = await image.readAsBytes();
    final model =
        GenerativeModel(model: 'gemini-pro-vision', apiKey: Secrets.apiKey);
    final categories = await _categoryService.allCategories();
    final prompt =
        'get amount,<emoji> category from bill, category should be any of: $categories';

    final content = [
      Content.multi([
        TextPart(prompt),
        DataPart('image/png', imageBytes),
      ])
    ];

    showSnackbar(context, 'Scanning the bill...');

    final response = await model.generateContent(content);

    try {
      final data = response.text!.split(',');
      final amount = double.tryParse(data[0]) ?? 0;
      final category = data[1].trim();
      final transaction = Transaction()
        ..amount = amount
        ..category = category
        ..name = '';
      await _transactionService.addTranasction(transaction);
      showSnackbar(context, 'Bill added');
    } catch (e) {
      showSnackbar(context, 'Something went wrong');
    }
  }

  Future<void> load() async {
    _currentDayExpense = await _transactionService.totalExpenseForDuration(
      duration: Duration(
        hours: DateTime.now().hour,
      ),
    );

    _currentMonthExpense = await _transactionService.totalExpenseForDuration(
      duration: Duration(
        days: DateTime.now().day,
      ),
    );
    _monthlyAverage = await _transactionService.currentMonthAverageExpense();
    _recentTransactions = await _transactionService.recentTransactions();
    _isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _transactionSubscription.cancel();
    super.dispose();
  }
}
