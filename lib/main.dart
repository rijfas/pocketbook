import 'package:flutter/material.dart';
import 'package:pocketbook/services/notification_service.dart';
import 'package:pocketbook/utils/db.dart';
import 'package:pocketbook/utils/notifications_manager.dart';
import 'services/budget_service.dart';
import 'services/category_service.dart';
import 'services/transaction_service.dart';
import 'utils/app_preferences.dart';
import 'package:provider/provider.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await Db.loadIsar();
  await NotificationsManager.initialize();
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => AppPreferences()),
        Provider(create: (_) => NotificationService(isar)),
        Provider(create: (_) => CategoryService(isar)),
        Provider(create: (_) => TransactionService(isar)),
        Provider(create: (_) => BudgetService(isar)),
      ],
      child: const App(),
    ),
  );
}
