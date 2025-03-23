part of 'task_bloc.dart';

@freezed
sealed class TaskEvent with _$TaskEvent {
  const factory TaskEvent.getTasks() = _GetTasksEvent;
  const factory TaskEvent.getTask(String id) = _GetTaskEvent;
  const factory TaskEvent.createTask(TaskEntity task) = _CreateTaskEvent;
  const factory TaskEvent.updateTask(TaskEntity task) = _UpdateTaskEvent;
  const factory TaskEvent.deleteTask(String id) = _DeleteTaskEvent;
}
