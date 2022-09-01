import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn);

  final void Function(String email, String password, String username,
      bool isLogin, BuildContext ctx) submitFn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '';
  String _userUsername = '';
  String _userPass = '';
  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPass.trim(), _userUsername.trim(),
          _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Card(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  TextFormField(
                    key: const ValueKey('email'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Enter a valid email adderss';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _userEmail = newValue;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(labelText: 'Email Address'),
                  ),
                  if (!_isLogin)
                    TextFormField(
                        key: const ValueKey('username'),
                        validator: (value) {
                          if (value.isEmpty || value.length < 2) {
                            return 'Username must containg at least 2 characters.';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _userUsername = newValue;
                        },
                        decoration:
                            const InputDecoration(labelText: 'Username')),
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 6) {
                        return 'Password must containg at least 6 characters.';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _userPass = newValue;
                    },
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RaisedButton(
                      onPressed: _trySubmit,
                      child: Text(_isLogin ? 'Login' : 'Sign up')),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(_isLogin
                        ? 'Create new account'
                        : 'Return to login form'),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
