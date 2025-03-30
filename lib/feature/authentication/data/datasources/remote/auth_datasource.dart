import 'package:fire_task/feature/authentication/domain/params/sign_in_params.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthDataSource {
  Future<void> signInWithEmailAndPassword(SignInParams signInParams);
  Future<UserCredential> createUserWithEmailAndPassword(
    SignInParams signInParams,
  );
  Future<void> signOut();
  Future<void> sendRecoveryEmail(String email);
  Future<void> signInWithCredentials(AuthCredential credential);
  Future<void> changeEmail(String email);
  Future<void> updatePassword(String password);
  Future<void> updatedProfilePhoto(String url);
  Future<void> sendVerificationEmail([ActionCodeSettings? actionCodeSettings]);
}

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;

  AuthDataSourceImpl(this._firebaseAuth);

  @override
  Future<void> changeEmail(String email) async {
    await _firebaseAuth.currentUser?.verifyBeforeUpdateEmail(email);
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
    SignInParams signInParams,
  ) async {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: signInParams.email,
      password: signInParams.password,
    );
  }

  @override
  Future<void> sendRecoveryEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> sendVerificationEmail([
    ActionCodeSettings? actionCodeSettings,
  ]) async {
    await _firebaseAuth.currentUser?.sendEmailVerification(actionCodeSettings);
  }

  @override
  Future<void> signInWithCredentials(AuthCredential credential) async {
    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> signInWithEmailAndPassword(SignInParams signInParams) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: signInParams.email,
      password: signInParams.password,
    );
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> updatePassword(String password) async {
    await _firebaseAuth.currentUser?.updatePassword(password);
  }

  @override
  Future<void> updatedProfilePhoto(String url) async {
    await _firebaseAuth.currentUser?.updatePhotoURL(url);
  }

  Future<void> changeDisplayName(String displayName) async {
    await _firebaseAuth.currentUser?.updateDisplayName(displayName);
  }
}
