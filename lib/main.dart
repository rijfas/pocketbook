import 'package:flutter/material.dart';
import 'package:pocketbook/services/budget_service.dart';
import 'package:pocketbook/services/category_service.dart';
import 'package:pocketbook/services/transaction_service.dart';
import 'package:pocketbook/utils/app_preferences.dart';
import 'package:provider/provider.dart';
import 'package:telephony/telephony.dart';

import 'app.dart';
import 'utils/isar.dart';

backgroundMessageHandler(SmsMessage message) async {
  print(message.body);
  //Handle background message
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await loadIsar();
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => AppPreferences()),
        Provider(create: (_) => CategoryService(isar)),
        Provider(create: (_) => TransactionService(isar)),
        Provider(create: (_) => BudgetService(isar)),
      ],
      child: const App(),
    ),
  );
}
