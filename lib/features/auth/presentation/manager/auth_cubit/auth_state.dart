part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInLoading extends AuthState {}

final class SignInFailure extends AuthState {
  final String message;
  SignInFailure({required this.message});
}

final class SignInSuccess extends AuthState {
  final UserModel userModel;
  SignInSuccess({required this.userModel});
}

final class SignUpLoading extends AuthState {}

final class SignUpFailure extends AuthState {
  final String message;
  SignUpFailure({required this.message});
}

final class SignUpSuccess extends AuthState {}

final class ForgotPasswordFailure extends AuthState {
  final String message;
  ForgotPasswordFailure({required this.message});
}

final class ForgotPasswordloading extends AuthState {}

final class ForgotPasswordSuccess extends AuthState {}
