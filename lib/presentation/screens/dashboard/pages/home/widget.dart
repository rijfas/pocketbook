import 'package:flutter/material.dart';
import 'widgets/summary_card.dart';
import 'widgets/transactions_list.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
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
                  icon: const Icon(Icons.document_scanner_outlined),
                  label: const Text('Scan Bill'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.support_agent),
                  label: const Text('Smart Advisor'),
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
          const TransactionsList(),
        ],
      ),
    );
  }
}
