import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/params/reorder_tasks_params.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReorderTasksUseCase implements UseCase<void, ReorderTasksParams> {
  final DashboardRepository _repository;

  ReorderTasksUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ReorderTasksParams params) {
    return _repository.reorderTasks(params.columnId, params.taskIds);
  }
}
