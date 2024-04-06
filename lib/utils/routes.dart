import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/screens/onboarding/route.dart';
import '../presentation/screens/get_started/route.dart';
import '../presentation/screens/dashboard/route.dart';
import '../presentation/screens/loading/route.dart';
import '../presentation/screens/settings/route.dart';

sealed class Routes {
  static const dashboard = 'dashboard';
  static const loading = 'loading';
  static const settings = 'settings';
  static const onboarding = 'onboarding';
  static const getStarted = 'get-started';

  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case dashboard:
        return Dashboard();
      case loading:
        return Loading();
      case settings:
        return Settings();
      case getStarted:
        return GetStarted();
      case onboarding:
        return Onboarding();
      default:
        throw Exception('Invalid Route: ${routeSettings.name}');
    }
  }
}
