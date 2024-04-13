import 'package:flutter_local_notifications/flutter_local_notifications.dart';

sealed class NotificationsManager {
  static Future<void> initialize() async {
    final plugin = FlutterLocalNotificationsPlugin();

    const settings = InitializationSettings(
      android: AndroidInitializationSettings('app_icon'),
    );

    await plugin.initialize(settings);
  }

  static Future<void> requestNotificationPermission() async {
    final plugin = FlutterLocalNotificationsPlugin();
    await plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
  }

  static Future<void> showTransactionNotification(double amount) async {
    final plugin = FlutterLocalNotificationsPlugin();

    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        '1',
        'pocketbooknotification',
        channelDescription: 'For auto track sms',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      ),
    );
    await plugin.show(
      0,
      'New transaction detected',
      'Transaction of $amount deteted, open app to add.',
      details,
    );
  }
}
