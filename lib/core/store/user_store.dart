import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:my_chat/core/domain/entities/user.dart';
import 'package:my_chat/core/domain/use_case/intreface/user_case.dart';
part 'user_store.g.dart';

@singleton
class UserStore = UserBaseStore with _$UserStore;

abstract class UserBaseStore with Store {
  final UserCase _userCase;
  UserBaseStore({required UserCase userCase}) : _userCase = userCase;

  @observable
  UserModel? currentUser;

  @observable
  ObservableFuture<UserModel?> setUserFuture = ObservableFuture.value(null);

  @computed
  bool get isLoading => setUserFuture.status == FutureStatus.pending;

  @action
  Future<void> setUserData() async {
    final future = _userCase.getUser();
    setUserFuture = ObservableFuture(future);
    currentUser = await setUserFuture;
  }
}
