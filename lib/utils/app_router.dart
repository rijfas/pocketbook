import 'package:flutter/material.dart';

import '../presentation/screens/loading/route.dart';

sealed class AppRouter {
  static const loadingScreen = 'loading-screen';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loadingScreen:
        return Loading();
      default:
        throw Exception('Invalid Route: ${settings.name}');
    }
  }
}
