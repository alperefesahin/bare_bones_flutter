import 'package:bare_bones_flutter/domain/model/user_model.dart';
import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.userModel = const UserModel(email: '', uid: ''),
    this.error = '',
    this.isLoading = false,
  });

  final UserModel userModel;
  final String error;
  final bool isLoading;

  @override
  List<Object> get props => [userModel, error, isLoading];

  SignUpState copyWith({
    UserModel? userModel,
    String? error,
    bool? isLoading,
  }) {
    return SignUpState(
      userModel: userModel ?? this.userModel,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory SignUpState.initial() => const SignUpState(
        userModel: UserModel(email: '', uid: ''),
        error: '',
        isLoading: false,
      );
}
