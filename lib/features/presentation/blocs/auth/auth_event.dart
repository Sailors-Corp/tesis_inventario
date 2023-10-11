// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class OnLoginEvent extends AuthEvent {
  final String user;
  final String password;

  OnLoginEvent(this.user, this.password);
}

class OnCheckLoginEvent extends AuthEvent {}

class OnLogOutEvent extends AuthEvent {}
