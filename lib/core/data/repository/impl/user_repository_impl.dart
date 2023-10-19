import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:my_chat/core/data/dto/user_mapper.dart';
import 'package:my_chat/core/data/repository/interface/user_repository.dart';
import 'package:my_chat/core/domain/entities/user.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserModel> getUser() async {
    var user = await Future<User>.value(FirebaseAuth.instance.currentUser);
    var userdata = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    return mapUser(user.uid, userdata['username']);
  }
}
