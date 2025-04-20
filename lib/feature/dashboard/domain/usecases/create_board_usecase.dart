import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/entities/board/board_entity.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateBoardUseCase implements UseCase<BoardEntity, BoardEntity> {
  final DashboardRepository _repository;

  CreateBoardUseCase(this._repository);

  @override
  Future<Either<Failure, BoardEntity>> call(BoardEntity board) {
    return _repository.createBoard(board);
  }
}
