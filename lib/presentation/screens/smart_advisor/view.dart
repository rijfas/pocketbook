import 'package:flutter/material.dart';
import 'package:pocketbook/models/chat_message.dart';
import 'package:pocketbook/presentation/screens/smart_advisor/controller.dart';
import 'package:pocketbook/presentation/screens/smart_advisor/widgets/message_tile.dart';
import 'package:pocketbook/presentation/widgets/empty_widget.dart';
import 'package:pocketbook/utils/show_alert_dialog.dart';
import 'package:provider/provider.dart';

import 'widgets/response_loading.dart';

class SmartAdvisorView extends StatefulWidget {
  const SmartAdvisorView({Key? key});

  @override
  _SmartAdvisorViewState createState() => _SmartAdvisorViewState();
}

class _SmartAdvisorViewState extends State<SmartAdvisorView> {
  late final TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Advisor'),
        actions: [
          IconButton(
              onPressed: () => showAlertDialog(context,
                          title: 'Clear chat?',
                          description: 'Clear all smart advisor chat')
                      .then(
                    (value) async {
                      if (value ?? false) {
                        await context.read<SmartAdvisorController>().clear();
                      }
                    },
                  ),
              icon: const Icon(
                Icons.clear_all,
              ))
        ],
      ),
      body: MessageList(),
      bottomNavigationBar: MessagePanel(),
    );
  }
}

class MessageList extends StatelessWidget {
  MessageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final messages = context.select<SmartAdvisorController, List<ChatMessage>>(
      (controller) => controller.chatHistory,
    );

    final responseLoading = context.select<SmartAdvisorController, bool>(
      (controller) => controller.responseLoading,
    );

    final isLoading = context.select<SmartAdvisorController, bool>(
      (controller) => controller.isLoading,
    );

    final isEmpty = context.select<SmartAdvisorController, bool>(
      (controller) => controller.isEmpty,
    );

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (isEmpty) {
      return const Center(
        child: EmptyWidget(
            message: 'Ask about budgeting, expense tracking, and more'),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView(
            reverse: true,
            children: [
              ...messages.map(
                (message) => MessageTile(message: message),
              ),
              if (responseLoading) const ResponseLoading(),
            ].reversed.toList(),
          ),
        ),
      ],
    );
  }
}

class MessagePanel extends StatelessWidget {
  MessagePanel({
    super.key,
  });

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final responseLoading = context.select<SmartAdvisorController, bool>(
      (controller) => controller.responseLoading,
    );

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            IconButton.filled(
              onPressed: responseLoading
                  ? null
                  : () {
                      String message = _textController.text;
                      if (message.isNotEmpty) {
                        context.read<SmartAdvisorController>().send(message);
                        _textController.clear();
                      }
                    },
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
