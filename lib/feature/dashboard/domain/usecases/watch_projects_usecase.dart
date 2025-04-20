import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/entities/project/project_entity.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchProjectsUseCase {
  final DashboardRepository _repository;

  WatchProjectsUseCase(this._repository);

  Stream<List<ProjectEntity>> call() {
    return _repository.watchProjects();
  }
}
