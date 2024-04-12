import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  late final SharedPreferences _prefs;
  String _userName = '';
  String _email = '';
  bool _isFirstRun = true;
  bool _smsTrackingEnabled = false;
  bool _notificationsEnabled = false;

  String get userName => _userName;
  String get email => _email;
  bool get isFirstRun => _isFirstRun;
  bool get smsTrackingEnabled => _smsTrackingEnabled;
  bool get notificationsEnabled => _notificationsEnabled;

  Future<void> load() async {
    _prefs = await SharedPreferences.getInstance();
    _isFirstRun = _prefs.getBool('isFirstRun') ?? true;
    print(_isFirstRun);
    _userName = _prefs.getString('userName') ?? '';
    _email = _prefs.getString('email') ?? '';
    _smsTrackingEnabled = _prefs.getBool('smsTrackingEnabled') ?? false;
    _notificationsEnabled = _prefs.getBool('notificationsEnabled') ?? false;
  }

  Future<void> savePreferences({
    required String userName,
    required String email,
    required bool smsTrackingEnabled,
  }) async {
    await _prefs.setString('userName', userName);
    await _prefs.setString('email', email);
    await _prefs.setBool('smsTrackingEnabled', smsTrackingEnabled);
    await _prefs.setBool('notificationsEnabled', true);
    await _prefs.setBool('isFirstRun', false);
  }

  Future<void> setUserName(String userName) async {
    await _prefs.setString('userName', userName);
  }

  Future<void> setEmail(String email) async {
    await _prefs.setString('email', email);
  }

  Future<void> setSmsTrackingEnabled(bool smsTrackingEnabled) async {
    await _prefs.setBool('smsTrackingEnabled', smsTrackingEnabled);
  }

  Future<void> setNotificationsEnabled(bool notificationsEnabled) async {
    await _prefs.setBool('notificationsEnabled', notificationsEnabled);
  }
}
