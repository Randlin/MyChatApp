import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'widgets/auth_form.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor, body: AuthForm());
  }
}
