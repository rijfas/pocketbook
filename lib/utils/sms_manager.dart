import 'package:telephony/telephony.dart';

import '../models/notification.dart';
import 'db.dart';
import 'notifications_manager.dart';
import 'extract_debit_amount.dart';

sealed class SmsManager {
  static Future<bool> setupSms() async {
    final telephony = Telephony.instance;
    final isSmsPermissionGranted = await telephony.requestSmsPermissions;
    if (isSmsPermissionGranted ?? false) {
      telephony.listenIncomingSms(
        onNewMessage: messageHandler,
        onBackgroundMessage: messageHandler,
      );
      await NotificationsManager.requestNotificationPermission();
      return true;
    }
    return false;
  }

  static Future<bool> requestSmsPermission() async {
    try {
      await Telephony.instance.requestSmsPermissions;
      return true;
    } catch (e) {
      return false;
    }
  }
}

messageHandler(SmsMessage message) async {
  final amount = extractDebitAmount(message.body!);
  if (amount == null) {
    return;
  }

  final isar = await Db.loadIsar();

  await isar.writeTxn(() async {
    await isar.notifications.put(
      Notification()
        ..amount = amount
        ..category = '',
    );
  });

  await NotificationsManager.showTransactionNotification(amount);
}
