import 'package:injectable/injectable.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/remote/task_remote_datasource.dart';
import '../models/task_model.dart';

@Injectable(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _remoteDataSource;

  TaskRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<TaskEntity>> getTasks() async {
    final tasks = await _remoteDataSource.getTasks();
    return tasks.map((task) => task.toEntity()).toList();
  }

  @override
  Future<TaskEntity> getTask(String id) async {
    final task = await _remoteDataSource.getTask(id);
    return task.toEntity();
  }

  @override
  Future<void> createTask(TaskEntity task) async {
    await _remoteDataSource.createTask(TaskModel.fromEntity(task));
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    await _remoteDataSource.updateTask(TaskModel.fromEntity(task));
  }

  @override
  Future<void> deleteTask(String id) async {
    await _remoteDataSource.deleteTask(id);
  }
}
