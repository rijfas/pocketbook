import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/screens/notifications/controller.dart';
import 'package:pocketbook/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'view.dart';

class Notifications extends MaterialPageRoute {
  Notifications({Key? key})
      : super(
          builder: (_) => ChangeNotifierProvider(
              create: (context) =>
                  NotificationsController(context.read<NotificationService>())
                    ..load(),
              child: const NotificationsView()),
        );
}
