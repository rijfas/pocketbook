import 'package:flutter/material.dart';
import 'package:pocketbook/models/budget.dart';
import 'package:pocketbook/presentation/screens/create_budget/route.dart';
import 'package:pocketbook/presentation/screens/onboarding/route.dart';
import 'package:pocketbook/presentation/screens/view_budget/route.dart';
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
  static const createBudget = 'create-budget';
  static const viewBudget = 'view-budget';

  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case dashboard:
        return Dashboard();
      case createBudget:
        return CreateBudget();
      case loading:
        return Loading();
      case settings:
        return Settings();
      case getStarted:
        return GetStarted();
      case onboarding:
        return Onboarding();
      case viewBudget:
        return ViewBudget(budget: routeSettings.arguments as Budget);
      default:
        throw Exception('Invalid Route: ${routeSettings.name}');
    }
  }
}
