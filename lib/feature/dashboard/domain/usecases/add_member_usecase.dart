import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/dashboard/domain/params/add_member_param.dart';
import 'package:fire_task/feature/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddMemberUseCase implements UseCase<void, AddMemberParams> {
  final DashboardRepository _repository;

  AddMemberUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(AddMemberParams params) {
    return _repository.addMember(params.projectId, params.userId);
  }
}
