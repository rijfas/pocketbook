import 'package:flutter/material.dart';

import 'utils/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFB8DAAE),
        ),
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.loading,
    );
  }
}
