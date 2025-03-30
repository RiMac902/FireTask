import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/authentication/domain/params/sign_in_params.dart';
import 'package:fire_task/feature/authentication/domain/usecases/logout_usecase.dart';
import 'package:fire_task/feature/authentication/domain/usecases/signin_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc(this._signInUseCase, this._logoutUseCase)
    : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      switch (event) {
        case SignIn(:final params):
          await _onSignIn(params, emit);
        case SignOut():
          await _onSignOut(emit);
      }
    });
  }

  Future<void> _onSignIn(SignInParams params, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _signInUseCase(params);
    result.fold(
      (failure) => emit(AuthState.failure(message: failure.toString())),
      (_) => emit(const AuthState.success()),
    );
  }

  Future<void> _onSignOut(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _logoutUseCase(const NoParams());
    result.fold(
      (failure) => emit(AuthState.failure(message: failure.toString())),
      (_) => emit(const AuthState.success()),
    );
  }
}
