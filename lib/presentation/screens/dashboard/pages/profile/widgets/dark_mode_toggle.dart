import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../utils/app_data.dart';

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkModeEnabled =
        context.select<AppData, bool>((appData) => appData.darkModeEnabled);

    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.notifications),
      ),
      title: const Text(
        'Dark mode',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: const Text(
        'Enable dark theme',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: Switch(
        value: darkModeEnabled,
        onChanged: context.read<AppData>().setDarkModeEnabled,
      ),
    );
  }
}
