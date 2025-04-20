import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteProjectUseCase implements UseCase<void, String> {
  final DashboardRepository _repository;

  DeleteProjectUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(String projectId) {
    return _repository.deleteProject(projectId);
  }
}
