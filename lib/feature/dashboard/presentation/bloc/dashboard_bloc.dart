import 'dart:async';

import 'package:fire_task/feature/dashboard/domain/entities/board/board_entity.dart';
import 'package:fire_task/feature/dashboard/domain/entities/project/project_entity.dart';
import 'package:fire_task/feature/tasks/domain/entities/task_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/dashboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository _repository;
  StreamSubscription? _projectsSubscription;
  StreamSubscription? _boardsSubscription;
  StreamSubscription? _tasksSubscription;

  DashboardBloc(this._repository) : super(const DashboardState.initial()) {
    on<LoadProjects>(_onLoadProjects);
    on<CreateProject>(_onCreateProject);
    on<UpdateProject>(_onUpdateProject);
    on<DeleteProject>(_onDeleteProject);
    on<AddMember>(_onAddMember);
    on<RemoveMember>(_onRemoveMember);
    on<LoadBoards>(_onLoadBoards);
    on<CreateBoard>(_onCreateBoard);
    on<UpdateBoard>(_onUpdateBoard);
    on<DeleteBoard>(_onDeleteBoard);
    on<ReorderColumns>(_onReorderColumns);
    on<LoadTasks>(_onLoadTasks);
    on<CreateTask>(_onCreateTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<MoveTask>(_onMoveTask);
    on<ReorderTasks>(_onReorderTasks);
    on<WatchProjects>(_onWatchProjects);
    on<WatchBoards>(_onWatchBoards);
    on<WatchTasks>(_onWatchTasks);
    on<WatchAllBoardTasks>(_onWatchAllBoardTasks);
  }

  @override
  Future<void> close() {
    _projectsSubscription?.cancel();
    _boardsSubscription?.cancel();
    _tasksSubscription?.cancel();
    return super.close();
  }

  Future<void> _onLoadProjects(
    LoadProjects event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.getProjects();
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (projects) => emit(
        DashboardState.loaded(
          projects: projects,
          boards: const [],
          tasks: const [],
        ),
      ),
    );
  }

  Future<void> _onWatchProjects(
    WatchProjects event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    await _projectsSubscription?.cancel();

    _projectsSubscription = _repository.watchProjects().listen(
      (projects) {
        add(ProjectsUpdated(projects));
      },
      onError: (error) {
        add(DashboardError(error.toString()));
      },
    );
  }

  Future<void> _onWatchBoards(
    WatchBoards event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    await _boardsSubscription?.cancel();

    _boardsSubscription = _repository
        .watchBoards(event.projectId)
        .listen(
          (boards) {
            add(BoardsUpdated(boards));
          },
          onError: (error) {
            add(DashboardError(error.toString()));
          },
        );
  }

  Future<void> _onWatchTasks(
    WatchTasks event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    await _tasksSubscription?.cancel();

    _tasksSubscription = _repository
        .watchTasks(event.boardId, event.columnId)
        .listen(
          (tasks) {
            add(TasksUpdated(tasks));
          },
          onError: (error) {
            add(DashboardError(error.toString()));
          },
        );
  }

  Future<void> _onWatchAllBoardTasks(
    WatchAllBoardTasks event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    await _tasksSubscription?.cancel();

    _tasksSubscription = _repository
        .watchAllBoardTasks(event.boardId)
        .listen(
          (tasks) {
            add(AllBoardTasksUpdated(tasks));
          },
          onError: (error) {
            add(DashboardError(error.toString()));
          },
        );
  }

  Future<void> _onCreateProject(
    CreateProject event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.createProject(event.project);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(const WatchProjects()),
    );
  }

  Future<void> _onUpdateProject(
    UpdateProject event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.updateProject(event.project);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(const WatchProjects()),
    );
  }

  Future<void> _onDeleteProject(
    DeleteProject event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.deleteProject(event.projectId);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(const WatchProjects()),
    );
  }

  Future<void> _onAddMember(
    AddMember event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.addMember(event.projectId, event.userId);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(const WatchProjects()),
    );
  }

  Future<void> _onRemoveMember(
    RemoveMember event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.removeMember(
      event.projectId,
      event.userId,
    );
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(const WatchProjects()),
    );
  }

  Future<void> _onLoadBoards(
    LoadBoards event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.getBoards(event.projectId);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (boards) => emit(
        DashboardState.loaded(
          projects: const [],
          boards: boards,
          tasks: const [],
        ),
      ),
    );
  }

  Future<void> _onCreateBoard(
    CreateBoard event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.createBoard(event.board);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(WatchBoards(event.board.projectId)),
    );
  }

  Future<void> _onUpdateBoard(
    UpdateBoard event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.updateBoard(event.board);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(WatchBoards(event.board.projectId)),
    );
  }

  Future<void> _onDeleteBoard(
    DeleteBoard event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.deleteBoard(event.boardId);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(const WatchProjects()),
    );
  }

  Future<void> _onReorderColumns(
    ReorderColumns event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.reorderColumns(
      event.boardId,
      event.columnIds,
    );
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(const WatchProjects()),
    );
  }

  Future<void> _onLoadTasks(
    LoadTasks event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.getTasks(event.boardId, event.columnId);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (tasks) => emit(
        DashboardState.loaded(
          projects: const [],
          boards: const [],
          tasks: tasks,
        ),
      ),
    );
  }

  Future<void> _onCreateTask(
    CreateTask event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.createTask(event.task);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(const WatchProjects()),
    );
  }

  Future<void> _onUpdateTask(
    UpdateTask event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.updateTask(event.task);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(const WatchProjects()),
    );
  }

  Future<void> _onDeleteTask(
    DeleteTask event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.deleteTask(event.taskId);
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(const WatchProjects()),
    );
  }

  Future<void> _onMoveTask(MoveTask event, Emitter<DashboardState> emit) async {
    emit(const DashboardState.loading());
    final result = await _repository.moveTask(
      event.taskId,
      event.fromColumnId,
      event.toColumnId,
    );
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(WatchAllBoardTasks(event.boardId)),
    );
  }

  Future<void> _onReorderTasks(
    ReorderTasks event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    final result = await _repository.reorderTasks(
      event.columnId,
      event.taskIds,
    );
    result.fold(
      (failure) => emit(DashboardState.error(failure.message)),
      (_) => add(WatchTasks(event.boardId, event.columnId)),
    );
  }
}
