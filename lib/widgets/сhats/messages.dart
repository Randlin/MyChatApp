import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future<User>.value(FirebaseAuth.instance.currentUser),
        builder: (context, fSnapshot) {
          if (fSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chat')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final chatDocs = snapshot.data?.docs;
                return ListView.builder(
                    reverse: true,
                    itemCount: chatDocs?.length,
                    itemBuilder: (context, index) => MessageBubble(
                          chatDocs?[index]['text'],
                          chatDocs?[index]['userId'] ==
                              fSnapshot.data.toString(),
                          chatDocs?[index]['userId'],
                        ));
              });
        });
  }
}
