import 'package:bare_bones_flutter/domain/model/user_model.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState({
    this.userModel = const UserModel(email: '', uid: ''),
    this.error = '',
    this.isLoading = false,
    this.isLoggedIn = false,
  });

  final UserModel userModel;
  final String error;
  final bool isLoading;
  final bool isLoggedIn;

  @override
  List<Object> get props => [userModel, error, isLoading, isLoggedIn];

  AuthState copyWith({
    UserModel? userModel,
    String? error,
    bool? isLoading,
    bool? isLoggedIn,
  }) {
    return AuthState(
      userModel: userModel ?? this.userModel,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  factory AuthState.initial() => const AuthState(
    userModel: UserModel(email: '', uid: ''),
    error: '',
    isLoading: false,
    isLoggedIn: false,
  );
}
