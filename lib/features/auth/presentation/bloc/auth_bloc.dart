// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:inventory_tesis/features/app/domain/repositories/app_repo.dart';
import 'package:inventory_tesis/features/auth/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.authRepository,
    this.appRepository,
  ) : super(const AuthState()) {
    on<OnLoginEvent>(_onLogin);
    on<OnCheckLoginEvent>(_onCheckLogin);
    on<OnLogOutEvent>(_onLogOut);
  }

  final AuthRepository authRepository;
  final AppRepository appRepository;

  Future<void> _onLogin(OnLoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());

    await Future.delayed(const Duration(seconds: 1));

    final response =
        await authRepository.authentication(event.user, event.password);

    if (response) {
      emit(SuccessfulAuthState());
    } else {
      emit(const FailureAuthState(
          "Por favor, verifique que el usuario y/o la contraseña sean correctos"));
    }
  }

  FutureOr<void> _onLogOut(OnLogOutEvent event, Emitter<AuthState> emit) {}

  FutureOr<void> _onCheckLogin(
      OnCheckLoginEvent event, Emitter<AuthState> emit) {}
}
