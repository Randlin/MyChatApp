// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AuthBaseStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'AuthBaseStore.isLoading'))
          .value;

  late final _$emailAtom = Atom(name: 'AuthBaseStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'AuthBaseStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: 'AuthBaseStore.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$isLoginAtom =
      Atom(name: 'AuthBaseStore.isLogin', context: context);

  @override
  bool get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(bool value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  late final _$successLoginAtom =
      Atom(name: 'AuthBaseStore.successLogin', context: context);

  @override
  bool get successLogin {
    _$successLoginAtom.reportRead();
    return super.successLogin;
  }

  @override
  set successLogin(bool value) {
    _$successLoginAtom.reportWrite(value, super.successLogin, () {
      super.successLogin = value;
    });
  }

  late final _$authFutureAtom =
      Atom(name: 'AuthBaseStore.authFuture', context: context);

  @override
  ObservableFuture<void> get authFuture {
    _$authFutureAtom.reportRead();
    return super.authFuture;
  }

  @override
  set authFuture(ObservableFuture<void> value) {
    _$authFutureAtom.reportWrite(value, super.authFuture, () {
      super.authFuture = value;
    });
  }

  late final _$onSignUpAsyncAction =
      AsyncAction('AuthBaseStore.onSignUp', context: context);

  @override
  Future<void> onSignUp() {
    return _$onSignUpAsyncAction.run(() => super.onSignUp());
  }

  late final _$onCreateUserAsyncAction =
      AsyncAction('AuthBaseStore.onCreateUser', context: context);

  @override
  Future<void> onCreateUser() {
    return _$onCreateUserAsyncAction.run(() => super.onCreateUser());
  }

  late final _$AuthBaseStoreActionController =
      ActionController(name: 'AuthBaseStore', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$AuthBaseStoreActionController.startAction(
        name: 'AuthBaseStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$AuthBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$AuthBaseStoreActionController.startAction(
        name: 'AuthBaseStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$AuthBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$AuthBaseStoreActionController.startAction(
        name: 'AuthBaseStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$AuthBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogin() {
    final _$actionInfo = _$AuthBaseStoreActionController.startAction(
        name: 'AuthBaseStore.setLogin');
    try {
      return super.setLogin();
    } finally {
      _$AuthBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
username: ${username},
isLogin: ${isLogin},
successLogin: ${successLogin},
authFuture: ${authFuture},
isLoading: ${isLoading}
    ''';
  }
}
