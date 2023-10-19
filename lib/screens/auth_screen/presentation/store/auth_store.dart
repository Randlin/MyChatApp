import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:my_chat/core/store/user_store.dart';
import 'package:my_chat/di/injector.dart';
import 'package:my_chat/screens/auth_screen/domain/use_case/interface/auth_case.dart';
part 'auth_store.g.dart';

@injectable
class AuthStore = AuthBaseStore with _$AuthStore;

abstract class AuthBaseStore with Store {
  final AuthCase _authCase;
  AuthBaseStore({required AuthCase authCase}) : _authCase = authCase;

  final userStore = getIt<UserStore>();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String username = '';

  @observable
  bool isLogin = true;

  @observable
  bool successLogin = false;

  @observable
  ObservableFuture<void> authFuture = ObservableFuture.value(null);

  @computed
  bool get isLoading => authFuture.status == FutureStatus.pending;

  @action
  Future<void> onSignUp() async {
    try {
      final params = AuthParams(
        email: email,
        password: password,
      );
      final future = _authCase.signUp(params);
      authFuture = ObservableFuture(future);
      await authFuture;
      userStore.setUserData();
      successLogin = true;
    } catch (e) {
      print(e.toString());
    }
  }

  @action
  Future<void> onCreateUser() async {
    try {
      final params = AuthParams(
        email: email,
        password: password,
      );
      final future = _authCase.createUser(params);
      authFuture = ObservableFuture(future);
      await authFuture;
      userStore.setUserData();
    } catch (e) {
      print(e.toString());
    }
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setLogin() {
    isLogin = !isLogin;
  }
}
