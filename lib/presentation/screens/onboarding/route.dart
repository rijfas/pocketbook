import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/screens/onboarding/controller.dart';
import 'package:pocketbook/utils/app_data.dart';
import 'package:provider/provider.dart';

import 'view.dart';

class Onboarding extends MaterialPageRoute {
  Onboarding({Key? key})
      : super(
          builder: (_) => Provider(
            create: (context) => OnboardingController(
              context.read<AppData>(),
            ),
            child: OnboardingView(),
          ),
        );
}
