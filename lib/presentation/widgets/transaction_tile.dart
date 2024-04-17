import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketbook/utils/formatters.dart';
import '../../models/transaction.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
    this.onLongPress,
  });

  final Transaction transaction;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      leading: CircleAvatar(
        child: Text(transaction.categoryEmoji),
      ),
      title: Text(
        toBeginningOfSentenceCase(transaction.categoryName.trim()),
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        DateFormat.MMMMEEEEd().format(transaction.createdAt),
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Text(
        Formatters.formatCurrency(transaction.amount),
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
