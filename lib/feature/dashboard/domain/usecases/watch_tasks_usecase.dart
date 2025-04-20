import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/entities/task/task_entity.dart';
import 'package:fire_task/feature/dashboard/domain/params/watch_tasks_params.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchTasksUseCase
    implements StreamUseCase<List<TaskEntity>, WatchTasksParams> {
  final DashboardRepository _repository;

  WatchTasksUseCase(this._repository);

  @override
  Stream<Either<Failure, List<TaskEntity>>> call(WatchTasksParams params) {
    try {
      return _repository
          .watchTasks(params.boardId, params.columnId)
          .map((tasks) {
            return Right<Failure, List<TaskEntity>>(tasks);
          })
          .handleError((error) {
            return Left<Failure, List<TaskEntity>>(
              Failure.server(error.toString()),
            );
          });
    } catch (e) {
      return Stream.value(
        Left<Failure, List<TaskEntity>>(Failure.server(e.toString())),
      );
    }
  }
}
