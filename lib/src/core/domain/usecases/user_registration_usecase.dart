import 'package:Quatr/src/core/data/repositories/auth/firebase_authentication_repository.dart';
import 'package:Quatr/src/core/domain/entities/user_entity.dart';

class UserRegistrationUseCase {
  final FirebaseAuthenticationRepository repository;

  UserRegistrationUseCase({required this.repository});

  Future<UserEntity?> execute(
      {required String email, required String password}) async {
    try {
      return await repository.signUpWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw e;
    }
  }
}
