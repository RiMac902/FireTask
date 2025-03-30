import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/authentication/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams param) async {
    try {
      await _authRepository.signOut();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
