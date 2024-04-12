import 'package:pocketbook/utils/app_preferences.dart';
import 'package:pocketbook/utils/message_handler.dart';
import 'package:telephony/telephony.dart';

class OnboardingController {
  late final AppPreferences _appPreferences;

  OnboardingController(this._appPreferences);

  Future<bool> savePreferences({
    required String userName,
    required String email,
    required bool smsTrackingEnabled,
  }) async {
    if (smsTrackingEnabled) {
      final telephony = Telephony.instance;
      final isSmsPermissionGranted = await telephony.requestSmsPermissions;
      if (isSmsPermissionGranted ?? false) {
        telephony.listenIncomingSms(
          onNewMessage: messageHandler,
          onBackgroundMessage: messageHandler,
        );
      } else {
        return false;
      }
    }
    await _appPreferences.savePreferences(
      userName: userName,
      email: email,
      smsTrackingEnabled: smsTrackingEnabled,
    );
    return true;
  }
}
