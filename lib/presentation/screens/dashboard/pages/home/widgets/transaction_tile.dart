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
        transaction.categoryName,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        ' ${DateFormat.MMMMEEEEd().format(transaction.createdAt)}',
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Text(
        '₹ ${transaction.amount.toString()}',
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
