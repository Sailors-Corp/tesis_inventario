// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
class AuthState {
  final bool? isAuth;

  const AuthState({
    this.isAuth,
  });

  AuthState copyWith({
    bool? isAuth,
  }) =>
      AuthState(
        isAuth: isAuth ?? isAuth,
      );
}

class LoadingAuthState extends AuthState {}

class SuccessfulAuthState extends AuthState {}

class FailureAuthState extends AuthState {
  final String error;

  const FailureAuthState(this.error);
}
