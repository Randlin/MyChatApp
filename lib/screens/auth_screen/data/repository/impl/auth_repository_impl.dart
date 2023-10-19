import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:my_chat/screens/auth_screen/data/repository/interface/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> signUp(AuthRepoParams params) async {
    print('checking ${params.email} ${params.password}');
    await _auth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    print('checking');
  }

  @override
  Future<void> createUser(AuthRepoParams params) async {
    UserCredential authResult = await _auth.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(authResult.user?.uid)
        .set({
      'username': params.username,
      'email': params.email,
    });
  }
}
