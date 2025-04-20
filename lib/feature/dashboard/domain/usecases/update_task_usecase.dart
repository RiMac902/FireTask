import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/entities/task/task_entity.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateTaskUseCase implements UseCase<void, TaskEntity> {
  final DashboardRepository _repository;

  UpdateTaskUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(TaskEntity task) {
    return _repository.updateTask(task);
  }
}
