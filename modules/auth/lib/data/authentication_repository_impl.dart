import 'package:auth/domain/data/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl(
    this.firebaseAuth,
  );

  final FirebaseAuth firebaseAuth;

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    try {
      return firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) {
    try {
      return firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw e;
    }
  }
}
