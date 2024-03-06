import 'package:flutter/material.dart';
import 'view.dart';

class Settings extends MaterialPageRoute {
  Settings({Key? key})
      : super(
          builder: (_) => const SettingsView(),
        );
}
