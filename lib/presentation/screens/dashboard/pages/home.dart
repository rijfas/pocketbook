import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions = [
      Transaction("🛒", "Groceries", "2022-03-01", -50.0),
      Transaction("🍔", "Dining", "2022-03-02", -30.0),
      Transaction("💰", "Salary", "2022-03-03", 2000.0),
      Transaction("🚗", "Gas", "2022-03-04", -40.0),
      Transaction("🎁", "Gift", "2022-03-05", -20.0),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '₹ 123,000',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monthly Cash In',
                          style: TextStyle(color: Colors.grey[100]),
                        ),
                        Text(
                          '+ ₹12340',
                          style: TextStyle(
                            color: Colors.green[200],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monthly Expense',
                          style: TextStyle(color: Colors.grey[100]),
                        ),
                        Text(
                          '- ₹12340',
                          style: TextStyle(
                            color: Colors.red[200],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.qr_code_scanner_rounded),
                  label: Text('Scan to pay'),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.money),
                  label: Text('Add Money'),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Recent Transactions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          // Divider
          Divider(),
          // List of Recent Transactions
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(transactions[index].emoji),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    ' ${transactions[index].date}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    '₹ ${transactions[index].amount.toString()}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Transaction {
  final String emoji;
  final String title;
  final String date;
  final double amount;

  Transaction(this.emoji, this.title, this.date, this.amount);
}
