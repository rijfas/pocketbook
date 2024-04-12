import 'package:flutter/material.dart';

import '../../../utils/routes.dart';
import 'pages/pages.dart';
import 'widgets/add_expense_sheet.dart';

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
    AnalyticsPage(),
    BudgetsPage(),
    ProfilePage(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('PocketBook'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(Routes.settings),
            icon: CircleAvatar(child: Icon(Icons.notifications)),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (int index) => setState(() {
                _index = index;
              }),
          destinations: const [
            NavigationDestination(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            NavigationDestination(
              label: 'Analytics',
              icon: Icon(Icons.pie_chart),
            ),
            NavigationDestination(
              label: 'Budgets',
              icon: Icon(Icons.work),
            ),
            NavigationDestination(
              label: 'Profile',
              icon: Icon(Icons.account_circle),
            ),
          ]),
      floatingActionButton: (_index == 0 || _index == 2)
          ? FloatingActionButton(
              onPressed: () async {
                if (_index == 0) {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => const AddExpenseSheet(),
                  );
                } else if (_index == 2) {
                  Navigator.of(context).pushNamed(Routes.createBudget);
                }
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
