import 'package:telephony/telephony.dart';

import '../models/notification.dart';
import 'db.dart';
import 'notifications_manager.dart';
import 'extract_debit_amount.dart';

@pragma('vm:entry-point')
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
