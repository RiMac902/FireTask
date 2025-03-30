import 'package:fire_task/feature/authentication/data/datasources/remote/auth_datasource.dart';
import 'package:fire_task/feature/authentication/domain/params/sign_in_params.dart';
import 'package:fire_task/feature/authentication/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<void> changeEmail(String email) {
    // TODO: implement changeEmail
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> sendRecoveryEmail(String email) {
    // TODO: implement sendRecoveryEmail
    throw UnimplementedError();
  }

  @override
  Future<void> sendVerificationEmail([ActionCodeSettings? actionCodeSettings]) {
    // TODO: implement sendVerificationEmail
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithCredentials(AuthCredential credential) {
    // TODO: implement signInWithCredentials
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword(SignInParams signInParams) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword(String password) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<void> updatedProfilePhoto(String url) {
    // TODO: implement updatedProfilePhoto
    throw UnimplementedError();
  }

  // ... implementation ...
}
