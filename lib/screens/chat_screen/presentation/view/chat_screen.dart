import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_chat/screens/chat_screen/presentation/view/widgets/%D1%81hats/new_message.dart';
import 'widgets/сhats/messages.dart';

@RoutePage()
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyChat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: FirebaseAuth.instance.signOut,
          )
        ],
      ),
      body: const Column(
        children: [
          Expanded(child: Messages()),
          NewMessage(),
        ],
      ),
    );
  }
}
