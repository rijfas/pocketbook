import 'package:flutter/material.dart';
import 'package:pocketbook/models/chat_message.dart';
import 'package:pocketbook/utils/formatters.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: message.isMe ? Radius.circular(8.0) : Radius.zero,
            topRight: message.isMe ? Radius.zero : Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!message.isMe) ...[
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 12.0,
                child: const Icon(
                  Icons.support_agent,
                  size: 20.0,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 4.0),
            ],
            Text(
              message.text,
              style: TextStyle(
                color: message.isMe ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              Formatters.compactTimeNormal(message.createdAt),
              style: TextStyle(
                fontSize: 12.0,
                color: message.isMe ? Colors.white : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
