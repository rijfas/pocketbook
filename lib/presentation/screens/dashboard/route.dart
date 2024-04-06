import 'package:flutter/material.dart';

import 'view.dart';

class Dashboard extends MaterialPageRoute {
  Dashboard({Key? key})
      : super(
          builder: (_) => const DashboardView(),
        );
}
