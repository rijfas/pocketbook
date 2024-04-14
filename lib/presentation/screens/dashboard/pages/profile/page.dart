import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/screens/dashboard/pages/profile/widgets/edit_profile_sheet.dart';
import 'package:pocketbook/presentation/screens/dashboard/pages/profile/widgets/preference_tile.dart';
import 'package:pocketbook/utils/routes.dart';

import 'widgets/dark_mode_toggle.dart';
import 'widgets/profile_card.dart';
import 'widgets/sms_tracking_toggle.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView(
        children: [
          const ProfileCard(),
          const SizedBox(height: 16),
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
                  const Divider(),
                  PreferenceTile(
                    title: 'Edit Profile',
                    subTitle: 'Change name, email',
                    icon: Icons.account_circle,
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) => const EditProfileSheet(),
                      );
                    },
                  ),
                  PreferenceTile(
                    icon: Icons.history,
                    title: 'Transaction History',
                    subTitle: 'View all transactions',
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.transactions),
                  ),
                  PreferenceTile(
                    icon: Icons.category,
                    title: 'Manage Categories',
                    subTitle: 'Manage custom categories',
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.categories),
                  ),
                  PreferenceTile(
                    icon: Icons.shield_outlined,
                    title: 'Terms of Use',
                    subTitle: 'View terms of use',
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.termsOfUse),
                  ),
                  PreferenceTile(
                    icon: Icons.question_mark,
                    title: 'FAQ',
                    subTitle: 'Frequently asked questions',
                    onTap: () => Navigator.of(context).pushNamed(Routes.faq),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
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
                  const Divider(),
                  const DarkModeToggle(),
                  const SmsTrackingToggle(),
                  PreferenceTile(
                    icon: Icons.delete,
                    title: 'Reset App Data',
                    subTitle: 'Clear all app data and restart',
                    primaryColor: Colors.red[700],
                    secondaryColor: Colors.red[50],
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
