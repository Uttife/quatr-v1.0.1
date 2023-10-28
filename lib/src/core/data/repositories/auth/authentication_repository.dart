import '../../../domain/entities/user_entity.dart';

abstract class AuthenticationRepository{
  Future<UserEntity?> signUpWithEmailAndPassword({
    required String email,
    required String password,
});

  Future<UserEntity?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}