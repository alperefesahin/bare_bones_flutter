import 'package:bare_bones_flutter/data/repository/auth_repository.dart';
import 'package:bare_bones_flutter/domain/model/user_model.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<UserModel> createUserWithEmailAndPassword({required String email, required String password}) async {
    final userCredential = await authRepository.createUserWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null) {
      final userModel = UserModel(
        email: userCredential.user!.email!,
        uid: userCredential.user!.uid,
        // and much more data
      );
      return Future(() => userModel);
    } else {
      throw Exception('User not created');
    }
  }

  Future<UserModel> signInWithEmailAndPassword({required String email, required String password}) async {
    final userCredential = await authRepository.signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null) {
      final userModel = UserModel(
        email: userCredential.user!.email!,
        uid: userCredential.user!.uid,
        // token etc.
      );
      return Future(() => userModel);
    } else {
      throw Exception('User not signed in');
    }
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }
}
