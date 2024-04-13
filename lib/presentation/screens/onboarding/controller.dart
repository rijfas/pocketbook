import 'package:pocketbook/services/category_service.dart';
import 'package:pocketbook/utils/app_data.dart';
import 'package:pocketbook/utils/sms_manager.dart';

class OnboardingController {
  late final AppData _appData;
  late final CategoryService _categoryService;

  OnboardingController(
    this._appData,
    this._categoryService,
  );

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
    await _categoryService.createDefaultCategories();
    await _appData.savePreferences(
      userName: userName,
      email: email,
      smsTrackingEnabled: smsTrackingEnabled,
    );
    return true;
  }
}
