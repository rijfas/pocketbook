import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/transaction.dart';
import 'controller.dart';
import 'widgets/summary_card.dart';
import 'widgets/transaction_tile.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final recentTransactions =
        context.select<HomePageController, List<Transaction>>(
      (controller) => controller.recentTransactions,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SummaryCard(),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.qr_code_scanner_rounded),
                  label: const Text('Scan to pay'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                  label: const Text('Send Money'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('View All'),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: recentTransactions.length,
              itemBuilder: (context, index) {
                return TransactionTile(
                  transaction: recentTransactions[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
