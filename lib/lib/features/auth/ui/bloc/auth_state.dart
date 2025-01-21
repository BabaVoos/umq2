part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final LoginResponseModel loginResponseModel;
  LoginSuccess({required this.loginResponseModel});
}

final class RegisterSuccess extends AuthState {
}


final class AuthFailed extends AuthState {
  final String message;
  AuthFailed({required this.message});
}

