import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    child: Text('RU'),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rijfas Usman',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'rijfas01@gmail.com',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'General',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.account_circle),
                    ),
                    title: Text(
                      'Edit Profile',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Change name, email',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.history),
                    ),
                    title: Text(
                      'Transaction History',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'View all transactions',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.category),
                    ),
                    title: Text(
                      'Manage Categories',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Create and manage categories',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.shield_outlined),
                    ),
                    title: Text(
                      'Terms of Use',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'View terms of use',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Preferences',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.notifications),
                    ),
                    title: Text(
                      'Notifications',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Enable app notifications',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Switch(
                      value: false,
                      onChanged: (_) => {},
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.sms),
                    ),
                    title: Text(
                      'SMS Tracking',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Auto add transactions by tracking sms',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Switch(
                      value: false,
                      onChanged: (_) => {},
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.question_mark),
                    ),
                    title: Text(
                      'FAQ',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Frequently asked questions',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.red[50],
                      child: Icon(
                        Icons.delete,
                        color: Colors.red[700],
                      ),
                    ),
                    title: Text(
                      'Reset App Data',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.red[700],
                      ),
                    ),
                    subtitle: Text(
                      'Clear all app data and restart',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
