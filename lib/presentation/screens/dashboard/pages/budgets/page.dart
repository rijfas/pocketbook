import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../services/budget_service.dart';
import 'controller.dart';
import 'widget.dart';

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: const BudgetsPageWidget(),
      create: (_) =>
          BudgetsPageController(context.read<BudgetService>())..load(),
    );
  }
}
