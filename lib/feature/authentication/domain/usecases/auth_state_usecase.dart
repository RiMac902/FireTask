// import 'package:fire_task/core/error/failures.dart';
// import 'package:fire_task/core/usecases/usecase.dart';
// import 'package:fire_task/feature/authentication/domain/repositories/auth_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:injectable/injectable.dart';

// @injectable
// class AuthStateUseCase implements StreamUseCase<User?, NoParams> {
//   final AuthRepository _authRepository;

//   AuthStateUseCase(this._authRepository);

//   @override
//   Stream<Either<Failure, User?>> call(NoParams params) {
//     try {
//       final Stream<User?> authStream = _authRepository.authStateChanges();
//       return authStream;
//     } on FirebaseAuthException catch (e) {
//       return Stream.value(Left(ServerFailure(e.message ?? 'Unknown error')));
//     }
//   }
// }
