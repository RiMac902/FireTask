import 'package:fire_task/core/error/failures.dart';
import 'package:fire_task/core/usecases/usecase.dart';
import 'package:fire_task/feature/authentication/domain/params/sign_in_params.dart';
import 'package:fire_task/feature/authentication/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase implements UseCase<void, SignInParams> {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  @override
  Future<Either<Failure, void>> call(SignInParams signInParams) async {
    try {
      await _authRepository.signInWithEmailAndPassword(signInParams);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
