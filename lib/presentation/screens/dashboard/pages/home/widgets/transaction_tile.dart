import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../models/transaction.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
        NumberFormat.compactSimpleCurrency(locale: 'en_IN')
            .format(transaction.amount),
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
