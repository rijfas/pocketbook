import 'package:flutter/material.dart';

import 'utils/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.loading,
    );
  }
}
