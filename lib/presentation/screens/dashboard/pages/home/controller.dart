// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketbook/services/category_service.dart';
import 'package:pocketbook/utils/ai_models.dart';
import 'package:pocketbook/utils/snackbar.dart';
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

    final categories = await _categoryService.allCategories();

    Snackbar.show(context, 'Scanning the bill...', autoHide: false);

    final transaction =
        await AiModels.detectTransactionFromBillImage(imageBytes, categories);

    Snackbar.hide(context);

    if (transaction != null) {
      await _transactionService.addTranasction(transaction);
      Snackbar.show(context, 'Bill added');
    } else {
      Snackbar.show(context, 'Something went wrong');
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
