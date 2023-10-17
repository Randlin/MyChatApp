import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_chat/widgets/%D1%81hats/new_message.dart';
import '../widgets/сhats/messages.dart';
import '../widgets/сhats/new_message.dart';

class ChatScreen extends StatelessWidget {
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
      body: Container(
          child: const Column(
        children: [
          Expanded(child: Messages()),
          NewMessage(),
        ],
      )),
    );
  }
}
