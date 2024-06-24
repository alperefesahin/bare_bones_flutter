import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/domain/usecase/auth/auth_usecase.dart';
import 'package:bare_bones_flutter/features/auth/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel();
});

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel() : super(AuthState.initial());

  final AuthUseCase authUseCase = getIt<AuthUseCase>();

  Future<void> createUserWithEmailAndPassword({required String email, required String password}) async {
    state = state.copyWith(isLoading: true);

    try {
      // to show properly, the loading indicator is working
      await Future.delayed(const Duration(seconds: 2));

      final userModel = await authUseCase.createUserWithEmailAndPassword(email: email, password: password);

      state = state.copyWith(isLoading: false, userModel: userModel);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    state = state.copyWith(isLoading: true);

    try {
      // to show properly, the loading indicator is working
      await Future.delayed(const Duration(seconds: 2));

      final userModel = await authUseCase.signInWithEmailAndPassword(email: email, password: password);

      state = state.copyWith(isLoading: false, userModel: userModel, isLoggedIn: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString(), isLoggedIn: false);
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);

    try {
      // to show properly, the loading indicator is working
      await Future.delayed(const Duration(seconds: 2));

      await authUseCase.signOut();

      state = state.copyWith(isLoading: false, isLoggedIn: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
