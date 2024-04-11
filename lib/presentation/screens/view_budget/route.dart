import 'package:flutter/material.dart';
import 'package:pocketbook/models/budget.dart';
import 'package:pocketbook/presentation/screens/view_budget/controller.dart';
import 'package:pocketbook/services/transaction_service.dart';
import 'package:provider/provider.dart';

import 'view.dart';

class ViewBudget extends MaterialPageRoute {
  ViewBudget({
    Key? key,
    required Budget budget,
  }) : super(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => ViewBudgetController(
              context.read<TransactionService>(),
              budget,
            )..load(),
            child: ViewBudgetView(
              budget: budget,
            ),
          ),
        );
}
