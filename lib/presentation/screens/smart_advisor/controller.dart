import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pocketbook/models/transaction.dart';
import 'package:pocketbook/services/chat_message_service.dart';
import 'package:pocketbook/services/transaction_service.dart';
import '../../../utils/ai_models.dart';
import '../../../models/chat_message.dart';

class SmartAdvisorController extends ChangeNotifier {
  SmartAdvisorController(
    this._chatMessageService,
    this._transactionService,
  ) {
    _subscription = _chatMessageService.listen((_) async {
      await load();
    });
  }

  final ChatMessageService _chatMessageService;
  final TransactionService _transactionService;

  late final StreamSubscription _subscription;

  late List<Transaction> _transactions;

  bool _isLoading = true;

  bool _responseLoading = false;

  List<ChatMessage> _chatHistory = [];

  List<ChatMessage> get chatHistory => UnmodifiableListView(_chatHistory);

  bool get isLoading => _isLoading;

  bool get responseLoading => _responseLoading;

  bool get isEmpty => _chatHistory.isEmpty;

  Future<void> load() async {
    _chatHistory = await _chatMessageService.all();
    _transactions = await _transactionService.allTransactions();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> clear() async {
    await _chatMessageService.clear();
  }

  Future<void> send(String query) async {
    final userMessage = ChatMessage()
      ..text = query
      ..isMe = true;

    await _chatMessageService.add([userMessage]);

    _responseLoading = true;

    notifyListeners();

    final model = AiModels.chatModel(_transactions);

    final chat = model.startChat(
      history: _chatHistory
          .map(
            (e) => Content(
              e.isMe ? 'user' : 'model',
              [
                TextPart(e.text),
              ],
            ),
          )
          .toList(),
    );

    final response = await chat.sendMessage(Content.text(query));

    final modelMessage = ChatMessage()
      ..text = response.text!
      ..isMe = false;

    await _chatMessageService.add([modelMessage]);

    _responseLoading = false;

    notifyListeners();
  }

  @override
  void dispose() async {
    await _subscription.cancel();
    super.dispose();
  }
}
