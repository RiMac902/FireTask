import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/entities/board/board_entity.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchBoardsUseCase {
  final DashboardRepository _repository;

  WatchBoardsUseCase(this._repository);

  Stream<List<BoardEntity>> call(String projectId) {
    return _repository.watchBoards(projectId);
  }
}
