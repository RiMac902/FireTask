import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/params/move_task_param.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class MoveTaskUseCase implements UseCase<void, MoveTaskParams> {
  final DashboardRepository _repository;

  MoveTaskUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(MoveTaskParams params) {
    return _repository.moveTask(
      params.taskId,
      params.fromColumnId,
      params.toColumnId,
    );
  }
}
