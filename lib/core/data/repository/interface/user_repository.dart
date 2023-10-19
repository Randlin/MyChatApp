import 'package:my_chat/core/domain/entities/user.dart';

abstract class UserRepository {
  Future<UserModel> getUser();
}
