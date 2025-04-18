import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/authentication/domain/params/sign_in_params.dart';
import 'package:fire_task/feature/authentication/domain/usecases/auth_state_usecase.dart';
import 'package:fire_task/feature/authentication/domain/usecases/logout_usecase.dart';
import 'package:fire_task/feature/authentication/domain/usecases/signin_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final LogoutUseCase _logoutUseCase;
  final AuthStateUseCase _authStateUseCase;
  StreamSubscription? _authStateSubscription;

  AuthBloc(this._signInUseCase, this._logoutUseCase, this._authStateUseCase)
    : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      switch (event) {
        case SignIn(:final params):
          await _onSignIn(params, emit);
        case SignOut():
          await _onSignOut(emit);
        case AuthStateChanged(:final user):
          _onAuthStateChanged(user, emit);
        case InitializeAuthState():
          _initializeAuthState();
      }
    });
  }

  void _initializeAuthState() {
    _authStateSubscription?.cancel();
    _authStateSubscription = _authStateUseCase.call(const NoParams()).listen((
      failureOrUser,
    ) {
      log('failureOrUser: $failureOrUser');
      failureOrUser.fold(
        (failure) => add(AuthEvent.authStateChanged(null)),
        (user) => add(AuthEvent.authStateChanged(user)),
      );
    });
  }

  void _onAuthStateChanged(User? user, Emitter<AuthState> emit) {
    if (user != null) {
      emit(const AuthState.authenticated());
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onSignIn(SignInParams params, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _signInUseCase(params);
    result.fold(
      (failure) => emit(AuthState.failure(message: failure.toString())),
      (_) {
        // After successful sign in, force a refresh of the auth state
        add(const AuthEvent.initializeAuthState());
      },
    );
  }

  Future<void> _onSignOut(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _logoutUseCase(const NoParams());
    result.fold(
      (failure) => emit(AuthState.failure(message: failure.toString())),
      (_) {
        // After successful logout, force a refresh of the auth state
        add(const AuthEvent.initializeAuthState());
      },
    );
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
