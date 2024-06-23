import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/domain/usecase/sign_up/sign_up_usecase.dart';
import 'package:bare_bones_flutter/features/auth/sign_up/state/sign_up_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpViewModelProvider = StateNotifierProvider<SignUpViewModel, SignUpState>((ref) {
  return SignUpViewModel();
});

class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel() : super(SignUpState.initial());

  final SignUpUseCase signUpUseCase = getIt<SignUpUseCase>();

  Future<void> createUserWithEmailAndPassword({required String email, required String password}) async {
    state = state.copyWith(isLoading: true);

    try {
      // to show properly, the loading indicator is working
      await Future.delayed(const Duration(seconds: 2));

      final userModel = await signUpUseCase.createUserWithEmailAndPassword(email: email, password: password);

      state = state.copyWith(isLoading: false, userModel: userModel);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
