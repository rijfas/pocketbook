import 'package:flutter/material.dart';
import 'package:pocketbook/utils/app_data.dart';
import 'package:provider/provider.dart';

class SmsTrackingToggle extends StatelessWidget {
  const SmsTrackingToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final smsTrackingEnabled = context.select<AppData, bool>(
      (appData) => appData.smsTrackingEnabled,
    );

    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.sms),
      ),
      title: const Text(
        'SMS Tracking',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: const Text(
        'Auto add transactions by tracking sms',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: Switch(
        value: smsTrackingEnabled,
        onChanged: context.read<AppData>().setSmsTrackingEnabled,
      ),
    );
  }
}
