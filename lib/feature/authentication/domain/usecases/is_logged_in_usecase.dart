import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/authentication/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class IsLoggedInUsecase implements UseCase<bool, NoParams> {
  final AuthRepository _authRepository;

  IsLoggedInUsecase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    try {
      final result = await _authRepository.isLoggedIn();
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
