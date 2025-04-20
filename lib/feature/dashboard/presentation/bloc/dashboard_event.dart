part of 'dashboard_bloc.dart';

@freezed
sealed class DashboardEvent with _$DashboardEvent {
  // Project events
  const factory DashboardEvent.loadProjects() = LoadProjects;
  const factory DashboardEvent.watchProjects() = WatchProjects;
  const factory DashboardEvent.projectsUpdated(List<ProjectEntity> projects) =
      ProjectsUpdated;
  const factory DashboardEvent.createProject(ProjectEntity project) =
      CreateProject;
  const factory DashboardEvent.updateProject(ProjectEntity project) =
      UpdateProject;
  const factory DashboardEvent.deleteProject(String projectId) = DeleteProject;
  const factory DashboardEvent.addMember(String projectId, String userId) =
      AddMember;
  const factory DashboardEvent.removeMember(String projectId, String userId) =
      RemoveMember;

  // Board events
  const factory DashboardEvent.loadBoards(String projectId) = LoadBoards;
  const factory DashboardEvent.watchBoards(String projectId) = WatchBoards;
  const factory DashboardEvent.boardsUpdated(List<BoardEntity> boards) =
      BoardsUpdated;
  const factory DashboardEvent.createBoard(BoardEntity board) = CreateBoard;
  const factory DashboardEvent.updateBoard(BoardEntity board) = UpdateBoard;
  const factory DashboardEvent.deleteBoard(String boardId) = DeleteBoard;
  const factory DashboardEvent.reorderColumns(
    String boardId,
    List<String> columnIds,
  ) = ReorderColumns;

  // Task events
  const factory DashboardEvent.loadTasks(String boardId, String columnId) =
      LoadTasks;
  const factory DashboardEvent.watchTasks(String boardId, String columnId) =
      WatchTasks;
  const factory DashboardEvent.watchAllBoardTasks(String boardId) =
      WatchAllBoardTasks;
  const factory DashboardEvent.tasksUpdated(List<TaskEntity> tasks) =
      TasksUpdated;
  const factory DashboardEvent.allBoardTasksUpdated(List<TaskEntity> tasks) =
      AllBoardTasksUpdated;
  const factory DashboardEvent.createTask(TaskEntity task) = CreateTask;
  const factory DashboardEvent.updateTask(TaskEntity task) = UpdateTask;
  const factory DashboardEvent.deleteTask(String taskId) = DeleteTask;
  const factory DashboardEvent.moveTask(
    String boardId,
    String taskId,
    String fromColumnId,
    String toColumnId,
  ) = MoveTask;
  const factory DashboardEvent.reorderTasks(
    String boardId,
    String columnId,
    List<String> taskIds,
  ) = ReorderTasks;

  // Error
  const factory DashboardEvent.error(String message) = DashboardError;
}
