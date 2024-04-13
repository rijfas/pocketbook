import 'package:pocketbook/utils/app_preferences.dart';
import 'package:pocketbook/utils/sms_manager.dart';

class OnboardingController {
  late final AppPreferences _appPreferences;

  OnboardingController(this._appPreferences);

  Future<bool> savePreferences({
    required String userName,
    required String email,
    required bool smsTrackingEnabled,
  }) async {
    if (smsTrackingEnabled) {
      if (!(await SmsManager.setupSms())) {
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
