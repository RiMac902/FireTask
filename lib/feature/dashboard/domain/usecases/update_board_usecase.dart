import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/entities/board/board_entity.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateBoardUseCase implements UseCase<void, BoardEntity> {
  final DashboardRepository _repository;

  UpdateBoardUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(BoardEntity board) {
    return _repository.updateBoard(board);
  }
}
