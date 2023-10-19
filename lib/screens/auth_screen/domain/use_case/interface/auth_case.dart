abstract class AuthCase {
  Future<void> signUp(AuthParams params);
  Future<void> createUser(AuthParams params);
}

class AuthParams {
  String email;
  String password;
  String? username;
  AuthParams({
    required this.email,
    required this.password,
    this.username,
  });
}
