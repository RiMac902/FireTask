part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = Initial;
  const factory SplashState.authenticated() = Authenticated;
  const factory SplashState.unauthenticated() = Unauthenticated;
  const factory SplashState.failure({required String message}) = Failure;
}
