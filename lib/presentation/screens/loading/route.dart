import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view.dart';

class Loading extends MaterialPageRoute {
  Loading({Key? key})
      : super(
          builder: (_) => const LoadingView(),
        );
}
