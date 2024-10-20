import 'package:flutter/material.dart';
import 'package:visibly/widgets/chat_messages.dart';
import 'package:visibly/widgets/new_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(child: ChatMessages()),
          NewMessage()
        ],
      ),
    );
  }
}