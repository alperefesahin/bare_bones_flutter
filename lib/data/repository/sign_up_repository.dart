import 'package:firebase_auth/firebase_auth.dart';

abstract class ISignUpRepository {
  final FirebaseAuth firebaseAuth;

  const ISignUpRepository(this.firebaseAuth);

  Future<UserCredential> createUserWithEmailAndPassword({required String email, required String password});
}

class SignUpRepository extends ISignUpRepository {
  SignUpRepository(super.firebaseAuth);

  @override
  Future<UserCredential> createUserWithEmailAndPassword({required String email, required String password}) {
    return firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
