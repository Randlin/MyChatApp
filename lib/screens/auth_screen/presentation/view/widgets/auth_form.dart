import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:my_chat/di/injector.dart';
import 'package:my_chat/routes/app_router.dart';
import 'package:my_chat/screens/auth_screen/presentation/store/auth_store.dart';
import 'package:provider/provider.dart';

class AuthForm extends StatelessWidget {
  AuthForm({super.key});

  final authStore = getIt<AuthStore>();
  ReactionDisposer customReaction(BuildContext context) {
    return reaction((success) => authStore.successLogin, (success) {
      if (success) {
        context.router.push(const ChatRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider<AuthStore>(
      create: (_) => authStore,
      child: Consumer<AuthStore>(builder: (_, store, __) {
        return Observer(builder: (context) {
          return ReactionBuilder(
              builder: customReaction,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Card(
                    margin: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Form(
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            _LoginTextField(
                                key: const ValueKey('email'),
                                labelText: 'Email',
                                onChanged: store.setEmail,
                                validator: (value) => null),
                            if (!store.isLogin)
                              _LoginTextField(
                                key: const ValueKey('username'),
                                labelText: 'Username',
                                onChanged: store.setUsername,
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 2) {
                                    return 'Username must containg at least 2 characters.';
                                  }
                                  return null;
                                },
                              ),
                            _LoginTextField(
                              key: const ValueKey('password'),
                              validator: (value) {
                                if (value!.isEmpty || value.length < 6) {
                                  return 'Password must containg at least 6 characters.';
                                }
                                return null;
                              },
                              labelText: 'Password',
                              onChanged: store.setPassword,
                              isPassword: true,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ElevatedButton(
                                onPressed: store.isLogin
                                    ? store.onSignUp
                                    : store.onCreateUser,
                                child:
                                    Text(store.isLogin ? 'Login' : 'Sign up')),
                            ElevatedButton(
                              onPressed: store.setLogin,
                              child: Text(store.isLogin
                                  ? 'Create new account'
                                  : 'Return to login form'),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        });
      }),
    );
  }
}

class _LoginTextField extends StatelessWidget {
  final Key key;
  final String labelText;
  final Function(String) onChanged;
  final String? Function(String?) validator;
  final bool isPassword;
  const _LoginTextField({
    required this.key,
    required this.labelText,
    required this.onChanged,
    required this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      validator: (value) => validator(value),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: labelText),
      onChanged: onChanged,
      obscureText: isPassword,
    );
  }
}
