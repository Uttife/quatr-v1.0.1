import 'package:Quatr/src/core/data/repositories/auth/firebase_authentication_repository.dart';
import 'package:Quatr/src/core/domain/entities/user_entity.dart';

class UserSignInUseCase {
  final FirebaseAuthenticationRepository repository;

  UserSignInUseCase({required this.repository});

  Future<UserEntity?> execute(
      {required String email, required String password}) async {
    try {
      return await repository.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw e;
    }
  }
}
