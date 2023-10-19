import 'package:injectable/injectable.dart';
import 'package:my_chat/core/data/repository/interface/user_repository.dart';
import 'package:my_chat/core/domain/entities/user.dart';
import 'package:my_chat/core/domain/use_case/intreface/user_case.dart';
import 'package:my_chat/di/injector.dart';

@Injectable(as: UserCase)
class UserCaseImpl implements UserCase {
  final UserRepository _userRepo = getIt<UserRepository>();

  @override
  Future<UserModel> getUser() async {
    return await _userRepo.getUser();
  }
}
