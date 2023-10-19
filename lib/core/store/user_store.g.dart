// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserBaseStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'UserBaseStore.isLoading'))
          .value;

  late final _$currentUserAtom =
      Atom(name: 'UserBaseStore.currentUser', context: context);

  @override
  UserModel? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$setUserFutureAtom =
      Atom(name: 'UserBaseStore.setUserFuture', context: context);

  @override
  ObservableFuture<UserModel?> get setUserFuture {
    _$setUserFutureAtom.reportRead();
    return super.setUserFuture;
  }

  @override
  set setUserFuture(ObservableFuture<UserModel?> value) {
    _$setUserFutureAtom.reportWrite(value, super.setUserFuture, () {
      super.setUserFuture = value;
    });
  }

  late final _$setUserDataAsyncAction =
      AsyncAction('UserBaseStore.setUserData', context: context);

  @override
  Future<void> setUserData() {
    return _$setUserDataAsyncAction.run(() => super.setUserData());
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
setUserFuture: ${setUserFuture},
isLoading: ${isLoading}
    ''';
  }
}
