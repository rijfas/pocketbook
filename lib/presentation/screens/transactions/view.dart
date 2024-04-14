import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/transaction.dart';
import 'controller.dart';
import '../../widgets/transaction_tile.dart';
import '../../../utils/show_alert_dialog.dart';
import '../../../utils/show_snackbar.dart';
import 'package:provider/provider.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions =
        context.select<TransactionsController, List<Transaction>>(
      (controller) => controller.transactions,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          IconButton(
            onPressed: () =>
                showSnackbar(context, 'Long press to delete a transaction'),
            icon: const Icon(Icons.question_mark),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => TransactionTile(
          transaction: transactions[index],
          onLongPress: () => showAlertDialog(
            context,
            title: 'Delete Transaction?',
            description:
                '${transactions[index].category} of ${NumberFormat.simpleCurrency(locale: 'en_IN').format(transactions[index].amount)} ${DateFormat.yMd().format(transactions[index].createdAt)}',
          ).then((confirmDelete) async {
            if (confirmDelete ?? false) {
              await context
                  .read<TransactionsController>()
                  .deleteTransaction(transactions[index]);
            }
          }),
        ),
        itemCount: transactions.length,
      ),
    );
  }
}