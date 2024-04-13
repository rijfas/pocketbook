import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../services/notification_service.dart';
import '../../../../utils/routes.dart';
import 'package:provider/provider.dart';

class NotificationsButton extends StatefulWidget {
  const NotificationsButton({
    super.key,
  });

  @override
  State<NotificationsButton> createState() => _NotificationsButtonState();
}

class _NotificationsButtonState extends State<NotificationsButton> {
  bool _hasNotification = false;
  late StreamSubscription _notificationSubscription;

  Future<void> load() async {
    final hasNotification =
        await context.read<NotificationService>().hasNotifications();
    setState(() {
      _hasNotification = hasNotification;
    });
  }

  @override
  void initState() {
    load();
    _notificationSubscription = context.read<NotificationService>().listen(
      (_) async {
        print('neww');
        await load();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _notificationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pushNamed(Routes.notifications),
      icon: CircleAvatar(
        child: (_hasNotification)
            ? const Badge(
                child: Icon(Icons.notifications),
              )
            : const Icon(Icons.notifications),
      ),
    );
  }
}
