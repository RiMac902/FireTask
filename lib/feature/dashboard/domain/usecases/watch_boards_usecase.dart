import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/entities/board/board_entity.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchBoardsUseCase implements StreamUseCase<List<BoardEntity>, String> {
  final DashboardRepository _repository;

  WatchBoardsUseCase(this._repository);

  @override
  Stream<Either<Failure, List<BoardEntity>>> call(String projectId) {
    try {
      return _repository
          .watchBoards(projectId)
          .map((boards) {
            return Right<Failure, List<BoardEntity>>(boards);
          })
          .handleError((error) {
            return Left<Failure, List<BoardEntity>>(
              Failure.server(error.toString()),
            );
          });
    } catch (e) {
      return Stream.value(
        Left<Failure, List<BoardEntity>>(Failure.server(e.toString())),
      );
    }
  }
}
