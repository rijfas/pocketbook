import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocketbook/utils/app_preferences.dart';
import 'package:pocketbook/utils/routes.dart';
import 'package:provider/provider.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    final appPreferences = context.read<AppPreferences>();
    appPreferences.load().then(
      (_) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: SystemUiOverlay.values)
            .then(
          (_) {
            if (appPreferences.isFirstRun) {
              Navigator.of(context).pushNamed(Routes.getStarted);
            } else {
              Navigator.of(context).pushNamed(Routes.dashboard);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: SystemUiOverlay.values);
            Navigator.of(context).pushNamed(Routes.dashboard);
          },
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
