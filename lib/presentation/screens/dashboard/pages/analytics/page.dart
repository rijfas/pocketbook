import 'package:flutter/material.dart';
import 'controller.dart';
import 'widget.dart';
import '../../../../../services/transaction_service.dart';
import 'package:provider/provider.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: const AnalyticsPageWidget(),
      create: (_) => AnalyticsPageController(
        context.read<TransactionService>(),
      )..load(),
    );
  }
}
