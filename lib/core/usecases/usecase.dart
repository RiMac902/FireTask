import 'package:fpdart/fpdart.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class SyncUseCase<Type, Params> {
  Type call({Params params});
}

class NoParams {
  const NoParams();
}
