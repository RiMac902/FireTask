import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/entities/project/project_entity.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateProjectUseCase implements UseCase<ProjectEntity, ProjectEntity> {
  final DashboardRepository _repository;

  CreateProjectUseCase(this._repository);

  @override
  Future<Either<Failure, ProjectEntity>> call(ProjectEntity params) {
    return _repository.createProject(params);
  }
}
