import 'package:bare_bones_flutter/data/repository/sign_up_repository.dart';
import 'package:bare_bones_flutter/domain/model/user_model.dart';

class SignUpUseCase {
  final SignUpRepository signUpRepository;

  SignUpUseCase(this.signUpRepository);

  Future<UserModel> createUserWithEmailAndPassword({required String email, required String password}) async {
    final userCredential = await signUpRepository.createUserWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null) {
      final userModel = UserModel(
        email: userCredential.user!.email!,
        uid: userCredential.user!.uid,
      );
      return Future(() => userModel);
    } else {
      throw Exception('User not created');
    }
  }
}
