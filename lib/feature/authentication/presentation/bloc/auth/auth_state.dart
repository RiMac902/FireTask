part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = Unauthenticated;
  const factory AuthState.loading() = Loading;
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.failure({required String message}) = Failure;
}
