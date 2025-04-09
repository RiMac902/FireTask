import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/authentication/domain/usecases/is_logged_in_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final IsLoggedInUsecase _isLoggedInUsecase;

  SplashBloc(this._isLoggedInUsecase) : super(SplashState.initial()) {
    on<SplashEvent>((event, emit) async {
      switch (event) {
        case Started():
          await _onStarted(emit);
      }
    });
  }

  Future<void> _onStarted(Emitter<SplashState> emit) async {
    log('_onStarted called');
    await Future.delayed(const Duration(seconds: 1));
    final result = await _isLoggedInUsecase.call(NoParams());
    result.fold(
      (failure) => emit(SplashState.failure(message: failure.toString())),
      (isLoggedIn) {
        log('isLoggedIn: ${isLoggedIn}');
        if (isLoggedIn) {
          emit(const SplashState.authenticated());
        } else {
          emit(const SplashState.unauthenticated());
        }
      },
    );
  }
}
