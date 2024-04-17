import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'services/budget_service.dart';
import 'services/category_service.dart';
import 'services/notification_service.dart';
import 'services/transaction_service.dart';
import 'services/chat_message_service.dart';
import 'utils/app_data.dart';
import 'utils/db.dart';
import 'utils/notifications_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final isar = await Db.loadIsar();
  await NotificationsManager.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppData(isar)),
        Provider(create: (_) => NotificationService(isar)),
        Provider(create: (_) => CategoryService(isar)),
        Provider(create: (_) => TransactionService(isar)),
        Provider(create: (_) => BudgetService(isar)),
        Provider(create: (_) => ChatMessageService(isar)),
      ],
      child: const App(),
    ),
  );
}
