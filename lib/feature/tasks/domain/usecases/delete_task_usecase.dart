import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteTaskUseCase implements UseCase<void, String> {
  final TaskRepository _repository;

  DeleteTaskUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(String id) async {
    try {
      await _repository.deleteTask(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
