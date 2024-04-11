import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/screens/create_budget/controller.dart';
import 'package:pocketbook/services/budget_service.dart';
import 'package:pocketbook/services/category_service.dart';
import 'package:provider/provider.dart';

import 'view.dart';

class CreateBudget extends MaterialPageRoute {
  CreateBudget({Key? key})
      : super(
          builder: (context) => ChangeNotifierProvider(
            create: (_) => CreateBudgetController(
              context.read<BudgetService>(),
              context.read<CategoryService>(),
            )..load(),
            child: const CreateBudgetView(),
          ),
        );
}
