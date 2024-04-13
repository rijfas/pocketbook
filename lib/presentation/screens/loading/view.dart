import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/app_data.dart';
import '../../../utils/routes.dart';
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
    final appData = context.read<AppData>();
    appData.load().then(
      (_) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: SystemUiOverlay.values)
            .then(
          (_) {
            if (appData.isFirstRun) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.getStarted, (_) => false);
            } else {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.dashboard, (_) => false);
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
