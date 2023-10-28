import 'package:Quatr/src/core/data/repositories/auth/authentication_repository.dart';
import 'package:Quatr/src/core/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserEntity?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = authResult.user;
      print(user);
      if (user != null) {
        return UserEntity(
            id: (user.uid),
            email: user.email ?? '',
            displayName: user.displayName ?? '');
      } else {
        return null;
      }
    } catch (e) {
      print('Error signing up: $e');
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserEntity?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential authResult = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = authResult.user;
      if (user != null) {
        return UserEntity(
            id: user.uid,
            email: user.email ?? '',
            displayName: user.displayName ?? '');
      } else {
        return null;
      }
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }
}
