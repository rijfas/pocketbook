import 'package:pocketbook/utils/app_data.dart';
import 'package:pocketbook/utils/sms_manager.dart';

class OnboardingController {
  late final AppData _appData;

  OnboardingController(this._appData);

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
    await _appData.savePreferences(
      userName: userName,
      email: email,
      smsTrackingEnabled: smsTrackingEnabled,
    );
    return true;
  }
}
