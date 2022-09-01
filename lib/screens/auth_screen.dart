import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(String email, String password, String username,
      bool isLogin, BuildContext ctx) async {
    AuthResult authResult;

    try {
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({'username': username, 'email': email});
      }
    } on PlatformException catch (error) {
      var message = 'Обнаружена ошибка';

      if (error.message != null) {
        message = error.message;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AuthForm(_submitAuthForm));
  }
}
