import 'dart:async';

import 'package:isar/isar.dart';

import '../models/chat_message.dart';

class ChatMessageService {
  final Isar _isar;

  ChatMessageService(this._isar);

  StreamSubscription<void> listen(void Function(void)? onData) {
    return _isar.chatMessages.watchLazy().listen(onData);
  }

  Future<List<ChatMessage>> all() async {
    final messages = await _isar.chatMessages.where().findAll();
    return messages;
  }

  Future<void> add(List<ChatMessage> messages) async {
    await _isar.writeTxn(() async {
      await _isar.chatMessages.putAll(messages);
    });
  }

  Future<void> clear() async {
    await _isar.writeTxn(() async {
      await _isar.chatMessages.clear();
    });
  }
}
