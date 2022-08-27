import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('chats/HmKpmsgN2MD9MXwCf27D/messages')
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data.documents;
          return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (ctx, index) => Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(documents[index]['text']),
                  ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Firestore.instance
              .collection('chats/HmKpmsgN2MD9MXwCf27D/messages')
              .add({'text': 'The button was clicked'});
        },
      ),
    );
  }
}
