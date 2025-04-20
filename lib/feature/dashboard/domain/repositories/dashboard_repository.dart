import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/feature/dashboard/domain/entities/board/board_entity.dart';
import 'package:fire_task/feature/dashboard/domain/entities/project/project_entity.dart';
import 'package:fire_task/feature/tasks/domain/entities/task_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class DashboardRepository {
  // Project operations
  Future<Either<Failure, List<ProjectEntity>>> getProjects();
  Stream<List<ProjectEntity>> watchProjects();
  Future<Either<Failure, ProjectEntity>> createProject(ProjectEntity project);
  Future<Either<Failure, void>> updateProject(ProjectEntity project);
  Future<Either<Failure, void>> deleteProject(String projectId);
  Future<Either<Failure, void>> addMember(String projectId, String userId);
  Future<Either<Failure, void>> removeMember(String projectId, String userId);

  // Board operations
  Future<Either<Failure, List<BoardEntity>>> getBoards(String projectId);
  Stream<List<BoardEntity>> watchBoards(String projectId);
  Future<Either<Failure, BoardEntity>> createBoard(BoardEntity board);
  Future<Either<Failure, void>> updateBoard(BoardEntity board);
  Future<Either<Failure, void>> deleteBoard(String boardId);
  Future<Either<Failure, void>> reorderColumns(
    String boardId,
    List<String> columnIds,
  );

  // Task operations
  Future<Either<Failure, List<TaskEntity>>> getTasks(
    String boardId,
    String columnId,
  );
  Stream<List<TaskEntity>> watchTasks(String boardId, String columnId);
  Stream<List<TaskEntity>> watchAllBoardTasks(String boardId);
  Future<Either<Failure, TaskEntity>> createTask(TaskEntity task);
  Future<Either<Failure, void>> updateTask(TaskEntity task);
  Future<Either<Failure, void>> deleteTask(String taskId);
  Future<Either<Failure, void>> moveTask(
    String taskId,
    String fromColumnId,
    String toColumnId,
  );
  Future<Either<Failure, void>> reorderTasks(
    String columnId,
    List<String> taskIds,
  );
}
