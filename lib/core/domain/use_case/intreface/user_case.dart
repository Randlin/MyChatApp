import 'package:my_chat/core/domain/entities/user.dart';

abstract class UserCase {
  Future<UserModel> getUser();
}
