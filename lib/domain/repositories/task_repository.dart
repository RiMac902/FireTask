import '../entities/task_entity.dart';

abstract interface class TaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<TaskEntity> getTask(String id);
  Future<void> createTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> deleteTask(String id);
}
