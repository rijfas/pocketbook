import 'package:flutter/material.dart';
import 'package:pocketbook/utils/app_data.dart';
import '../../../../utils/routes.dart';
import 'package:provider/provider.dart';

class NotificationsButton extends StatelessWidget {
  const NotificationsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final hasNotification = context.select<AppData, bool>(
      (appData) => appData.hasNotification,
    );

    return IconButton(
      onPressed: () => Navigator.of(context).pushNamed(Routes.notifications),
      icon: CircleAvatar(
        child: (hasNotification)
            ? const Badge(
                child: Icon(Icons.notifications),
              )
            : const Icon(Icons.notifications),
      ),
    );
  }
}
