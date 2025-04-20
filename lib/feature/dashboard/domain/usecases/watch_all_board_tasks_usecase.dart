import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/entities/task/task_entity.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchAllBoardTasksUseCase
    implements StreamUseCase<List<TaskEntity>, String> {
  final DashboardRepository _repository;

  WatchAllBoardTasksUseCase(this._repository);

  @override
  Stream<Either<Failure, List<TaskEntity>>> call(String boardId) {
    try {
      return _repository
          .watchAllBoardTasks(boardId)
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
