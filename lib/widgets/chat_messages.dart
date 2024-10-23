import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:visibly/utils/constants.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({super.key});

  @override
  _ChatMessagesState createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  // List to hold chat messages
  List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    // Fetch initial chat messages and set up real-time updates
    _fetchMessages();
    _subscribeToMessages();
  }

  // Fetch initial chat messages
  Future<void> _fetchMessages() async {
    final response = await Supabase.instance.client
        .from('chat')
        .select()
        .order('created_at', ascending: true); // Order by time
    setState(() {
      _messages = response;
    });
  }

  // Subscribe to new messages in real-time
  void _subscribeToMessages() {
   supabase
        .from('chat')
        .stream(primaryKey: ['id']);
    supabase.channel('chat').onPostgresChanges(
        event: PostgresChangeEvent.all,
        table: 'chat',
        callback: (payload) {
          log('Change received: ${payload.toString()}');
        })
    .subscribe();
  }

  @override
  void dispose() {
    supabase.removeAllChannels(); // Clean up subscriptions
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _messages.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: message['avatar_url'] != null
                      ? NetworkImage(message['avatar_url'])
                      : null,
                ),
                title: Text(message['username'] ?? 'Unknown'),
                subtitle: Text(message['message']),
                trailing: Text(
                  message['created_at'] != null
                      ? DateTime.parse(message['created_at'])
                          .toLocal()
                          .toString()
                      : '',
                ),
              );
            },
          );
  }
}
