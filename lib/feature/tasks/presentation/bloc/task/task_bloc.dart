import 'package:fire_task/core/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/task_entity.dart';
import '../../../domain/usecases/get_tasks_usecase.dart';
import '../../../domain/usecases/get_task_usecase.dart';
import '../../../domain/usecases/create_task_usecase.dart';
import '../../../domain/usecases/update_task_usecase.dart';
import '../../../domain/usecases/delete_task_usecase.dart';
import 'package:injectable/injectable.dart';

part 'task_event.dart';
part 'task_state.dart';
part 'task_bloc.freezed.dart';

@injectable
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasksUseCase _getTasksUseCase;
  final GetTaskUseCase _getTaskUseCase;
  final CreateTaskUseCase _createTaskUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  TaskBloc(
    this._createTaskUseCase,
    this._deleteTaskUseCase,
    this._getTaskUseCase,
    this._getTasksUseCase,
    this._updateTaskUseCase,
  ) : super(const TaskState.initial()) {
    on<_GetTasksEvent>(_onGetTasks);
    on<_GetTaskEvent>(_onGetTask);
    on<_CreateTaskEvent>(_onCreateTask);
    on<_UpdateTaskEvent>(_onUpdateTask);
    on<_DeleteTaskEvent>(_onDeleteTask);
  }

  Future<void> _onGetTasks(
    _GetTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskState.loading());
    final result = await _getTasksUseCase(NoParams());
    result.fold(
      (failure) => emit(TaskState.error(failure.toString())),
      (tasks) => emit(TaskState.loaded(tasks)),
    );
  }

  Future<void> _onGetTask(_GetTaskEvent event, Emitter<TaskState> emit) async {
    emit(const TaskState.loading());
    final result = await _getTaskUseCase(event.id);
    result.fold(
      (failure) => emit(TaskState.error(failure.toString())),
      (task) => emit(TaskState.taskLoaded(task)),
    );
  }

  Future<void> _onCreateTask(
    _CreateTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskState.loading());
    await _createTaskUseCase(event.task);
    emit(const TaskState.success('Task created successfully'));
  }

  Future<void> _onUpdateTask(
    _UpdateTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskState.loading());
    await _updateTaskUseCase(event.task);
    emit(const TaskState.success('Task updated successfully'));
  }

  Future<void> _onDeleteTask(
    _DeleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskState.loading());
    await _deleteTaskUseCase(event.id);
    emit(const TaskState.success('Task deleted successfully'));
  }
}
