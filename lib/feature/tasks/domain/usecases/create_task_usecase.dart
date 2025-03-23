import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateTaskUseCase {
  final TaskRepository _repository;

  CreateTaskUseCase(this._repository);

  Future<void> call(TaskEntity task) async {
    await _repository.createTask(task);
  }
}
