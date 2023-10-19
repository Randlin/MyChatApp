import 'package:my_chat/core/domain/entities/user.dart';

UserModel mapUser(String id, String name) {
  return UserModel(
    id: id,
    name: name,
  );
}
