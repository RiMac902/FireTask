import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateTaskUseCase {
  final TaskRepository _repository;

  UpdateTaskUseCase(this._repository);

  Future<void> call(TaskEntity task) async {
    await _repository.updateTask(task);
  }
}
