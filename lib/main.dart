import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/screens/auth_screen/auth_screen.dart';
import './screens/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                backgroundColor: Colors.deepOrange,
                buttonTheme: ButtonTheme.of(context).copyWith(
                    buttonColor: Colors.green,
                    textTheme: ButtonTextTheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
                    .copyWith(secondary: Colors.deepOrange)),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ChatScreen();
                }
                return AuthScreen();
              },
            ),
          );
        });
  }
}
