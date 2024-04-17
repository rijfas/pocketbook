import 'package:isar/isar.dart';

part 'chat_message.g.dart';

@collection
class ChatMessage {
  Id id = Isar.autoIncrement;

  late String text;

  late bool isMe;

  DateTime createdAt = DateTime.now();
}
