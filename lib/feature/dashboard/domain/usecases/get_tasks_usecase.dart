import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/entities/task/task_entity.dart';
import 'package:fire_task/feature/dashboard/domain/params/get_tasks_params.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTasksUseCase implements UseCase<List<TaskEntity>, GetTasksParams> {
  final DashboardRepository _repository;

  GetTasksUseCase(this._repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(GetTasksParams params) {
    return _repository.getTasks(params.boardId, params.columnId);
  }
}
