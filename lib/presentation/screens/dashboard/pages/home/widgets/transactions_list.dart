import 'package:flutter/material.dart';
import 'package:pocketbook/models/transaction.dart';
import 'package:pocketbook/presentation/screens/dashboard/pages/home/controller.dart';
import 'package:pocketbook/presentation/widgets/transaction_tile.dart';
import 'package:provider/provider.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<HomePageController, bool>(
      (controller) => controller.isLoading,
    );

    final recentTransactions =
        context.select<HomePageController, List<Transaction>>(
      (controller) => controller.recentTransactions,
    );

    if (isLoading) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: recentTransactions.length,
        itemBuilder: (context, index) {
          return TransactionTile(
            transaction: recentTransactions[index],
          );
        },
      ),
    );
  }
}
