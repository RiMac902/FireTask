import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/feature/dashboard/data/datasources/dashboard_datasource.dart';
import 'package:fire_task/feature/dashboard/data/models/board/board_model.dart';
import 'package:fire_task/feature/dashboard/data/models/project/project_model.dart';
import 'package:fire_task/feature/dashboard/data/models/task/task_model.dart';
import 'package:fire_task/feature/dashboard/domain/entities/board/board_entity.dart';
import 'package:fire_task/feature/dashboard/domain/entities/project/project_entity.dart';
import 'package:fire_task/feature/tasks/domain/entities/task_entity.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardDataSource _dataSource;

  DashboardRepositoryImpl(this._dataSource);

  @override
  Stream<List<BoardEntity>> watchBoards(String projectId) {
    return _dataSource
        .watchBoards(projectId)
        .map((boards) => boards.map((board) => board.toEntity()).toList());
  }

  @override
  Stream<List<ProjectEntity>> watchProjects() {
    return _dataSource.watchProjects().map(
      (projects) => projects.map((project) => project.toEntity()).toList(),
    );
  }

  @override
  Stream<List<TaskEntity>> watchTasks(String boardId, String columnId) {
    return _dataSource
        .watchTasks(boardId, columnId)
        .map((tasks) => tasks.map((task) => task.toEntity()).toList());
  }

  @override
  Stream<List<TaskEntity>> watchAllBoardTasks(String boardId) {
    return _dataSource
        .watchAllBoardTasks(boardId)
        .map((tasks) => tasks.map((task) => task.toEntity()).toList());
  }

  @override
  Future<Either<Failure, void>> addMember(String projectId, String userId) {
    // TODO: implement addMember
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BoardEntity>> createBoard(BoardEntity board) {
    // TODO: implement createBoard
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProjectEntity>> createProject(ProjectEntity project) {
    // TODO: implement createProject
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskEntity>> createTask(TaskEntity task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteBoard(String boardId) {
    // TODO: implement deleteBoard
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteProject(String projectId) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteTask(String taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BoardEntity>>> getBoards(String projectId) {
    // TODO: implement getBoards
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> getProjects() {
    // TODO: implement getProjects
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks(
    String boardId,
    String columnId,
  ) {
    // TODO: implement getTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> moveTask(
    String taskId,
    String fromColumnId,
    String toColumnId,
  ) {
    // TODO: implement moveTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> removeMember(String projectId, String userId) {
    // TODO: implement removeMember
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> reorderColumns(
    String boardId,
    List<String> columnIds,
  ) {
    // TODO: implement reorderColumns
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> reorderTasks(
    String columnId,
    List<String> taskIds,
  ) {
    // TODO: implement reorderTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateBoard(BoardEntity board) {
    // TODO: implement updateBoard
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateProject(ProjectEntity project) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateTask(TaskEntity task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
