import 'package:fpdart/fpdart.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

class GetTaskUseCase implements UseCase<TaskEntity, String> {
  final TaskRepository _repository;

  GetTaskUseCase(this._repository);

  @override
  Future<Either<Failure, TaskEntity>> call(String id) async {
    try {
      final task = await _repository.getTask(id);
      return Right(task);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
