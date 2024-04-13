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
  bool _notificationsEnabled = false;
  bool _hasNotification = false;

  String get userName => _userName;
  String get email => _email;
  bool get isFirstRun => _isFirstRun;
  bool get smsTrackingEnabled => _smsTrackingEnabled;
  bool get notificationsEnabled => _notificationsEnabled;
  bool get hasNotification => _hasNotification;

  Future<void> load() async {
    _prefs = await SharedPreferences.getInstance();
    _isFirstRun = _prefs.getBool('isFirstRun') ?? true;
    _userName = _prefs.getString('userName') ?? '';
    _email = _prefs.getString('email') ?? '';
    _smsTrackingEnabled = _prefs.getBool('smsTrackingEnabled') ?? false;
    _notificationsEnabled = _prefs.getBool('notificationsEnabled') ?? false;
    _hasNotification = (await _isar.notifications.count()) > 0;
    notifyListeners();
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

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
