import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  final FirebaseAuth firebaseAuth;

  const IAuthRepository(this.firebaseAuth);

  Future<UserCredential> createUserWithEmailAndPassword({required String email, required String password});

  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password});

  Future<void> signOut();
}

class AuthRepository extends IAuthRepository {
  AuthRepository(super.firebaseAuth);

  @override
  Future<UserCredential> createUserWithEmailAndPassword({required String email, required String password}) {
    return firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password}) {
    return firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() {
    return firebaseAuth.signOut();
  }
}
