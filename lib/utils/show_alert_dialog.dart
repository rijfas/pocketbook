import 'package:flutter/material.dart';

Future<bool?> showAlertDialog(
  BuildContext context, {
  required String title,
  required String description,
  String positiveText = 'Ok',
  String negativeText = 'Cancel',
}) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(positiveText),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(negativeText),
        ),
      ],
    ),
  );
}
