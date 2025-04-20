part of 'dashboard_bloc.dart';

@freezed
sealed class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.loaded({
    required List<ProjectEntity> projects,
    required List<BoardEntity> boards,
    required List<TaskEntity> tasks,
  }) = _Loaded;
  const factory DashboardState.error(String message) = _Error;
}
