import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/params/reorder_columns_param.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReorderColumnsUseCase implements UseCase<void, ReorderColumnsParams> {
  final DashboardRepository _repository;

  ReorderColumnsUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(ReorderColumnsParams params) {
    return _repository.reorderColumns(params.boardId, params.columnIds);
  }
}
