import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/budget.dart';
import '../models/category.dart';
import '../models/transaction.dart';

Future<Isar> loadIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      CategorySchema,
      TransactionSchema,
      BudgetSchema,
    ],
    directory: dir.path,
  );
  return isar;
}
