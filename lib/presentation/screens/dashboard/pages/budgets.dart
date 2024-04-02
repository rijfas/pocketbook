import 'package:flutter/material.dart';

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.business_center),
          ),
          title: Text('2023-2024'),
          subtitle: Text('23,000'),
          trailing: CircularProgressIndicator(
            value: 0.5,
          ),
        )
      ],
    );
  }
}
