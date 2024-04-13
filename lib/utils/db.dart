import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/notification.dart';
import '../models/budget.dart';
import '../models/category.dart';
import '../models/transaction.dart';

sealed class Db {
  static Future<Isar> loadIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = Isar.getInstance() ??
        await Isar.open(
          [
            CategorySchema,
            TransactionSchema,
            BudgetSchema,
            NotificationSchema,
          ],
          directory: dir.path,
        );
    return isar;
  }
}
