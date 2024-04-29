import 'package:pocketbook/utils/message_handler.dart';
import 'package:telephony/telephony.dart';

import 'notifications_manager.dart';

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
