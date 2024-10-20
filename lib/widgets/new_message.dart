import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visibly/utils/constants.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final TextEditingController _messageController= TextEditingController();
  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
  void _submitMessage()async{
    final enteredMessage=_messageController.text;
    if(enteredMessage.trim().isEmpty){
      return;
    }
    final uid=FirebaseAuth.instance.currentUser!.uid;
      // Query the Supabase 'profiles' table for the user profile data by UID
    final profileData = await supabase
        .from('profiles')
        .select()
        .eq('id', uid)
        .single(); // .single() to fetch one record only
//send to supabase
await supabase.from('chat').insert({
                          'id':uid,
                          'username':profileData['username'],
                          'avatar_url':profileData['avatar_url'],
                          'message':enteredMessage
                         })
      .eq('id', uid);  // Add condition to update where id matches the Firebase UID
    _messageController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(
      left: 15,
      right: 1,
      bottom: 14
    ),
    child: Row(
      children: [
        Expanded(child: TextField(
          controller: _messageController,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration:const InputDecoration(
              labelText: 'Send a message...'
            ),
        )),
        IconButton(
          color: AppColors.appDark,
          onPressed: _submitMessage, icon:const Icon(Icons.send))
      ],
    ),
    );
  }
}