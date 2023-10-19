abstract class AuthRepository {
  Future<void> signUp(AuthRepoParams params);
  Future<void> createUser(AuthRepoParams params);
}

class AuthRepoParams {
  String email;
  String password;
  String? username;
  AuthRepoParams({
    required this.email,
    required this.password,
    this.username,
  });
}
