import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pocketbook/utils/assets.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(Assets.emptyAnimation),
        Text(
          message,
          style: TextStyle(
            color: Colors.blueGrey[100],
          ),
        ),
      ],
    );
  }
}
