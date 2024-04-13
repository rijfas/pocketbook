import 'dart:async';

import 'package:isar/isar.dart';
import '../models/notification.dart';

class NotificationService {
  final Isar _isar;

  NotificationService(this._isar);

  StreamSubscription<void> listen(void Function(void)? onData) {
    return _isar.notifications.watchLazy().listen(onData);
  }

  Future<bool> hasNotifications() async {
    final count = await _isar.notifications.count();
    return count > 0;
  }

  Future<List<Notification>> allNotifications() async {
    final notifications = await _isar.notifications.where().findAll();
    return notifications;
  }

  Future<void> deleteNotification(Notification notification) async {
    await _isar.writeTxn(() async {
      await _isar.notifications.delete(notification.id);
    });
  }
}
