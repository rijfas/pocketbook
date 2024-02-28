import 'package:flutter/material.dart';
import 'utils/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRouter.loadingScreen,
    );
  }
}
