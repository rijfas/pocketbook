import 'package:flutter/material.dart';

import 'utils/app_colors.dart';
import 'utils/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.dashboard,
    );
  }
}
