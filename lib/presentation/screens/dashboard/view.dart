import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/routes.dart';
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
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => BottomSheet(
              onClosing: () {},
              builder: (_) => SingleChildScrollView(
                padding: MediaQuery.of(context).viewInsets,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add Expense',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(Icons.close),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.tag),
                          labelText: 'Expense Name',
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.currency_rupee),
                          labelText: 'Amount',
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('Category'),
                        ],
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Chip(
                                avatar: Icon(Icons.check), label: Text('Food')),
                            TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.add),
                                label: Text('New'))
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                              onPressed: () {}, child: Text('Add')))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
