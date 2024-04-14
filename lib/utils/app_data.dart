import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import '../models/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppData extends ChangeNotifier {
  late final SharedPreferences _prefs;
  late final Isar _isar;
  late final StreamSubscription _streamSubscription;

  AppData(this._isar) {
    _streamSubscription = _isar.notifications.watchLazy().listen((event) async {
      _hasNotification = (await _isar.notifications.count()) > 0;
      notifyListeners();
    });
  }

  String _userName = '';
  String _email = '';
  bool _isFirstRun = true;
  bool _smsTrackingEnabled = false;
  bool _hasNotification = false;
  bool _darkModeEnabled = false;

  String get userName => _userName;
  String get email => _email;
  bool get isFirstRun => _isFirstRun;
  bool get smsTrackingEnabled => _smsTrackingEnabled;
  bool get hasNotification => _hasNotification;
  bool get darkModeEnabled => _darkModeEnabled;

  Future<void> load() async {
    _prefs = await SharedPreferences.getInstance();
    _isFirstRun = _prefs.getBool('isFirstRun') ?? true;
    _userName = _prefs.getString('userName') ?? '';
    _email = _prefs.getString('email') ?? '';
    _smsTrackingEnabled = _prefs.getBool('smsTrackingEnabled') ?? false;
    _darkModeEnabled = _prefs.getBool('darkModeEnabled') ?? false;
    _hasNotification = (await _isar.notifications.count()) > 0;
    notifyListeners();
  }

  Future<void> savePreferences({
    required String userName,
    required String email,
    required bool smsTrackingEnabled,
  }) async {
    _userName = userName;
    _email = email;
    _smsTrackingEnabled = smsTrackingEnabled;
    _isFirstRun = false;
    await _prefs.setString('userName', userName);
    await _prefs.setString('email', email);
    await _prefs.setBool('smsTrackingEnabled', smsTrackingEnabled);
    await _prefs.setBool('isFirstRun', false);
    await _prefs.setBool('darkModeEnabled', false);
    notifyListeners();
  }

  Future<void> setUserName(String userName) async {
    await _prefs.setString('userName', userName);
    _userName = userName;
    notifyListeners();
  }

  Future<void> setEmail(String email) async {
    await _prefs.setString('email', email);
    _email = email;
    notifyListeners();
  }

  Future<void> setSmsTrackingEnabled(bool smsTrackingEnabled) async {
    await _prefs.setBool('smsTrackingEnabled', smsTrackingEnabled);
    _smsTrackingEnabled = smsTrackingEnabled;
    notifyListeners();
  }

  Future<void> setDarkModeEnabled(bool darkModeEnabled) async {
    await _prefs.setBool('darkModeEnabled', darkModeEnabled);
    _darkModeEnabled = darkModeEnabled;
    notifyListeners();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
