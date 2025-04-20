import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteBoardUseCase implements UseCase<void, String> {
  final DashboardRepository _repository;

  DeleteBoardUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(String boardId) {
    return _repository.deleteBoard(boardId);
  }
}
