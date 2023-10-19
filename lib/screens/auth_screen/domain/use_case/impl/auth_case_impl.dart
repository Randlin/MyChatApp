import 'package:injectable/injectable.dart';
import 'package:my_chat/di/injector.dart';
import 'package:my_chat/screens/auth_screen/data/repository/interface/auth_repository.dart';
import 'package:my_chat/screens/auth_screen/domain/use_case/interface/auth_case.dart';

@Injectable(as: AuthCase)
class AuthCaseImpl implements AuthCase {
  final AuthRepository _authRepository = getIt<AuthRepository>();

  @override
  Future<void> signUp(AuthParams params) async {
    final AuthRepoParams repoParams = AuthRepoParams(
      email: params.email,
      password: params.password,
      username: params.username,
    );
    return await _authRepository.signUp(repoParams);
  }

  @override
  Future<void> createUser(AuthParams params) async {
    final AuthRepoParams repoParams = AuthRepoParams(
      email: params.email,
      password: params.password,
      username: params.username,
    );
    return await _authRepository.createUser(repoParams);
  }
}
