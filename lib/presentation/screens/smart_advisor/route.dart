import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/screens/smart_advisor/controller.dart';
import 'package:pocketbook/services/chat_message_service.dart';
import 'package:pocketbook/services/transaction_service.dart';
import 'package:provider/provider.dart';
import 'view.dart';

class SmartAdvisor extends MaterialPageRoute {
  SmartAdvisor({Key? key})
      : super(
          builder: (_) => ChangeNotifierProvider(
              create: (context) => SmartAdvisorController(
                  context.read<ChatMessageService>(),
                  context.read<TransactionService>())
                ..load(),
              child: const SmartAdvisorView()),
        );
}
