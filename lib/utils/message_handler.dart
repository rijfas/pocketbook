import 'package:pocketbook/models/transaction.dart';
import 'package:pocketbook/utils/isar.dart';
import 'package:telephony/telephony.dart';

messageHandler(SmsMessage message) async {
  print('Handling SMS');
  final isar = await loadIsar();
  await isar.writeTxn(() async {
    await isar.transactions.put(Transaction()
      ..category = 'sms'
      ..amount = 0.0
      ..name = 'sms');
  });
  print('Done');
}
