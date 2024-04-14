import 'package:flutter/material.dart';
import 'package:pocketbook/utils/app_data.dart';
import 'package:provider/provider.dart';

import 'utils/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final darkModeEnabled =
        context.select<AppData, bool>((appData) => appData.darkModeEnabled);

    return MaterialApp(
      themeMode: darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
        brightness: Brightness.dark,
      )),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: Routes.loading,
      debugShowCheckedModeBanner: false,
    );
  }
}
