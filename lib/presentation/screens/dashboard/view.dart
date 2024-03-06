import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'pages/pages.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({
    super.key,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final _pages = const [
    HomePage(),
    TransactionsPage(),
    BudgetsPage(),
    SmartAdvisorPage(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('PocketBook'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              child: Text('RI'),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _index,
        onTap: (int index) => setState(() {
          _index = index;
        }),
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(FontAwesomeIcons.house),
          ),
          BottomNavigationBarItem(
            label: 'Transactions',
            icon: Icon(FontAwesomeIcons.rightLeft),
          ),
          BottomNavigationBarItem(
            label: 'Budgets',
            icon: Icon(FontAwesomeIcons.briefcase),
          ),
          BottomNavigationBarItem(
            label: 'Smart Advisor',
            icon: Icon(FontAwesomeIcons.robot),
          ),
        ],
      ),
    );
  }
}
