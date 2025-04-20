import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/params/remove_member_param.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveMemberUseCase implements UseCase<void, RemoveMemberParams> {
  final DashboardRepository _repository;

  RemoveMemberUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(RemoveMemberParams params) {
    return _repository.removeMember(params.projectId, params.userId);
  }
}
