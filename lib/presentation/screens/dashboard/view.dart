import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pocketbook/utils/routes.dart';

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
            onPressed: () => Navigator.of(context).pushNamed(Routes.settings),
            icon: CircleAvatar(
              child: Text('RI'),
            ),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (int index) => setState(() {
                _index = index;
              }),
          destinations: [
            NavigationDestination(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            NavigationDestination(
              label: 'Transactions',
              icon: Icon(Icons.compare_arrows_rounded),
            ),
            NavigationDestination(
              label: 'Budgets',
              icon: Icon(Icons.work),
            ),
            NavigationDestination(
              label: 'Smart Advisor',
              icon: Icon(Icons.chat),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
