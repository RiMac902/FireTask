import 'package:fpdart/fpdart.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTasksUseCase implements UseCase<List<TaskEntity>, NoParams> {
  final TaskRepository _repository;

  GetTasksUseCase(this._repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(NoParams params) async {
    try {
      final tasks = await _repository.getTasks();
      return Right(tasks);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
