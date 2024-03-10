import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'utils/isar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await loadIsar();
  runApp(
    Provider(
      create: (_) => isar,
      child: const App(),
    ),
  );
}
