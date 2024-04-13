import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart' hide Notification;
import 'package:pocketbook/models/notification.dart';
import 'package:pocketbook/services/notification_service.dart';

class NotificationsController extends ChangeNotifier {
  final NotificationService _service;

  NotificationsController(this._service) {
    _notificationSubscription = _service.listen((_) async {
      await load();
    });
  }

  late final StreamSubscription _notificationSubscription;

  bool _isLoading = true;

  List<Notification> _notifications = [];

  bool get isLoading => _isLoading;

  List<Notification> get notifications => UnmodifiableListView(_notifications);

  Future<void> load() async {
    _notifications = await _service.allNotifications();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> removeNotification(Notification notification) async {
    await _service.deleteNotification(notification);
  }

  @override
  void dispose() async {
    await _notificationSubscription.cancel();
    super.dispose();
  }
}
