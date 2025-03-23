import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../../models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> getTask(String id);
  Future<void> createTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(String id);
}

@Injectable(as: TaskRemoteDataSource)
class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final FirebaseFirestore _firestore;
  final String _collection = 'tasks';

  @injectable
  TaskRemoteDataSourceImpl(@Named('firestore') this._firestore);

  @override
  Future<List<TaskModel>> getTasks() async {
    final snapshot = await _firestore.collection(_collection).get();
    return snapshot.docs.map((doc) => TaskModel.fromJson(doc.data())).toList();
  }

  @override
  Future<TaskModel> getTask(String id) async {
    final doc = await _firestore.collection(_collection).doc(id).get();
    return TaskModel.fromJson(doc.data() ?? {});
  }

  @override
  Future<void> createTask(TaskModel task) async {
    await _firestore.collection(_collection).doc(task.id).set(task.toJson());
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    await _firestore.collection(_collection).doc(task.id).update(task.toJson());
  }

  @override
  Future<void> deleteTask(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }
}
