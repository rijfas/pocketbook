import 'package:flutter/material.dart';
import '../presentation/screens/dashboard/route.dart';
import '../presentation/screens/loading/route.dart';
import '../presentation/screens/settings/route.dart';

sealed class Routes {
  static const dashboard = 'dashboard';
  static const loading = 'loading';
  static const settings = 'settings';

  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case dashboard:
        return Dashboard();
      case loading:
        return Loading();
      case settings:
        return Settings();
      default:
        throw Exception('Invalid Route: ${routeSettings.name}');
    }
  }
}
