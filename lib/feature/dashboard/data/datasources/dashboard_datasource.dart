import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/feature/dashboard/data/models/board/board_model.dart';
import 'package:fire_task/feature/dashboard/data/models/project/project_model.dart';
import 'package:fire_task/feature/dashboard/data/models/task/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

abstract interface class DashboardDataSource {
  // Project operations
  Future<Either<Failure, List<ProjectModel>>> getProjects();
  Stream<List<ProjectModel>> watchProjects();
  Future<Either<Failure, ProjectModel>> createProject(ProjectModel project);
  Future<Either<Failure, void>> updateProject(ProjectModel project);
  Future<Either<Failure, void>> deleteProject(String projectId);
  Future<Either<Failure, void>> addMember(String projectId, String userId);
  Future<Either<Failure, void>> removeMember(String projectId, String userId);

  // Board operations
  Future<Either<Failure, List<BoardModel>>> getBoards(String projectId);
  Stream<List<BoardModel>> watchBoards(String projectId);
  Future<Either<Failure, BoardModel>> createBoard(BoardModel board);
  Future<Either<Failure, void>> updateBoard(BoardModel board);
  Future<Either<Failure, void>> deleteBoard(String boardId);
  Future<Either<Failure, void>> reorderColumns(
    String boardId,
    List<String> columnIds,
  );

  // Task operations
  Future<Either<Failure, List<TaskModel>>> getTasks(
    String boardId,
    String columnId,
  );
  Stream<List<TaskModel>> watchTasks(String boardId, String columnId);
  Stream<List<TaskModel>> watchAllBoardTasks(String boardId);
  Future<Either<Failure, TaskModel>> createTask(TaskModel task);
  Future<Either<Failure, void>> updateTask(TaskModel task);
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

@Injectable(as: DashboardDataSource)
class DashboardRepositoryImpl implements DashboardDataSource {
  final FirebaseFirestore _firestore;

  DashboardRepositoryImpl(this._firestore);

  @override
  Future<Either<Failure, List<ProjectModel>>> getProjects() async {
    try {
      final snapshot = await _firestore.collection('projects').get();
      final projects =
          snapshot.docs
              .map(
                (doc) => ProjectModel.fromJson({...doc.data(), 'id': doc.id}),
              )
              .toList();
      return Right(projects);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<List<ProjectModel>> watchProjects() {
    return _firestore
        .collection('projects')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map(
                    (doc) =>
                        ProjectModel.fromJson({...doc.data(), 'id': doc.id}),
                  )
                  .toList(),
        );
  }

  @override
  Future<Either<Failure, ProjectModel>> createProject(
    ProjectModel project,
  ) async {
    try {
      final docRef = await _firestore
          .collection('projects')
          .add(project.toJson());
      return Right(project.copyWith(id: docRef.id));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProject(ProjectModel project) async {
    try {
      await _firestore
          .collection('projects')
          .doc(project.id)
          .update(project.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProject(String projectId) async {
    try {
      await _firestore.collection('projects').doc(projectId).delete();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addMember(
    String projectId,
    String userId,
  ) async {
    try {
      await _firestore.collection('projects').doc(projectId).update({
        'members.$userId': true,
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeMember(
    String projectId,
    String userId,
  ) async {
    try {
      await _firestore.collection('projects').doc(projectId).update({
        'members.$userId': FieldValue.delete(),
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BoardModel>>> getBoards(String projectId) async {
    try {
      final snapshot =
          await _firestore
              .collection('boards')
              .where('projectId', isEqualTo: projectId)
              .get();

      final boards =
          snapshot.docs
              .map((doc) => BoardModel.fromJson({...doc.data(), 'id': doc.id}))
              .toList();
      return Right(boards);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<List<BoardModel>> watchBoards(String projectId) {
    return _firestore
        .collection('boards')
        .where('projectId', isEqualTo: projectId)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map(
                    (doc) => BoardModel.fromJson({...doc.data(), 'id': doc.id}),
                  )
                  .toList(),
        );
  }

  @override
  Future<Either<Failure, BoardModel>> createBoard(BoardModel board) async {
    try {
      final docRef = await _firestore.collection('boards').add(board.toJson());
      return Right(board.copyWith(id: docRef.id));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateBoard(BoardModel board) async {
    try {
      await _firestore
          .collection('boards')
          .doc(board.id)
          .update(board.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBoard(String boardId) async {
    try {
      await _firestore.collection('boards').doc(boardId).delete();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> reorderColumns(
    String boardId,
    List<String> columnIds,
  ) async {
    try {
      final batch = _firestore.batch();
      final boardRef = _firestore.collection('boards').doc(boardId);

      for (var i = 0; i < columnIds.length; i++) {
        batch.update(boardRef, {'columns.${columnIds[i]}.order': i});
      }

      await batch.commit();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks(
    String boardId,
    String columnId,
  ) async {
    try {
      final snapshot =
          await _firestore
              .collection('tasks')
              .where('boardId', isEqualTo: boardId)
              .where('columnId', isEqualTo: columnId)
              .get();

      final tasks =
          snapshot.docs
              .map((doc) => TaskModel.fromJson({...doc.data(), 'id': doc.id}))
              .toList();
      return Right(tasks);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<List<TaskModel>> watchTasks(String boardId, String columnId) {
    return _firestore
        .collection('tasks')
        .where('boardId', isEqualTo: boardId)
        .where('columnId', isEqualTo: columnId)
        .orderBy('order')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map(
                    (doc) => TaskModel.fromJson({...doc.data(), 'id': doc.id}),
                  )
                  .toList(),
        );
  }

  @override
  Stream<List<TaskModel>> watchAllBoardTasks(String boardId) {
    return _firestore
        .collection('tasks')
        .where('boardId', isEqualTo: boardId)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map(
                    (doc) => TaskModel.fromJson({...doc.data(), 'id': doc.id}),
                  )
                  .toList(),
        );
  }

  @override
  Future<Either<Failure, TaskModel>> createTask(TaskModel task) async {
    try {
      final docRef = await _firestore.collection('tasks').add(task.toJson());
      return Right(task.copyWith(id: docRef.id));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(TaskModel task) async {
    try {
      await _firestore.collection('tasks').doc(task.id).update(task.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(String taskId) async {
    try {
      await _firestore.collection('tasks').doc(taskId).delete();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> moveTask(
    String taskId,
    String fromColumnId,
    String toColumnId,
  ) async {
    try {
      await _firestore.collection('tasks').doc(taskId).update({
        'columnId': toColumnId,
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> reorderTasks(
    String columnId,
    List<String> taskIds,
  ) async {
    try {
      final batch = _firestore.batch();

      for (var i = 0; i < taskIds.length; i++) {
        final taskRef = _firestore.collection('tasks').doc(taskIds[i]);
        batch.update(taskRef, {'order': i});
      }

      await batch.commit();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
