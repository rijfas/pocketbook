import 'package:flutter/material.dart';

sealed class Snackbar {
  static void show(
    BuildContext context,
    String message, {
    bool autoHide = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: (autoHide)
            ? Text(message)
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(message),
                  Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(),
                  ),
                ],
              ),
        duration: (autoHide)
            ? const Duration(milliseconds: 4000)
            : const Duration(days: 365),
      ),
    );
  }

  static void hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
