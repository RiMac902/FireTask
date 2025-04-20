import 'package:fire_task/feature/dashboard/domain/entities/task/task_entity.dart';
import 'package:fire_task/feature/dashboard/domain/params/watch_tasks_params.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchTasksUseCase {
  final DashboardRepository _repository;

  WatchTasksUseCase(this._repository);

  Stream<List<TaskEntity>> call(WatchTasksParams params) {
    return _repository.watchTasks(params.boardId, params.columnId);
  }
}
