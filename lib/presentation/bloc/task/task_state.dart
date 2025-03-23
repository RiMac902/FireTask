part of 'task_bloc.dart';

@freezed
sealed class TaskState with _$TaskState {
  const factory TaskState.initial() = Initial;
  const factory TaskState.loading() = Loading;
  const factory TaskState.loaded(List<TaskEntity> tasks) = Loaded;
  const factory TaskState.taskLoaded(TaskEntity task) = TaskLoaded;
  const factory TaskState.success(String message) = Success;
  const factory TaskState.error(String message) = Error;
}
