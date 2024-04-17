import 'package:flutter/material.dart';
import 'package:pocketbook/services/category_service.dart';
import 'package:provider/provider.dart';

import 'controller.dart';
import 'widget.dart';
import '../../../../../services/transaction_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageController(
        context.read<TransactionService>(),
        context.read<CategoryService>(),
      )..load(),
      child: const HomePageWidget(),
    );
  }
}
