import 'package:fire_task/feature/authentication/domain/params/sign_in_params.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRepository {
  Future<void> signInWithEmailAndPassword(SignInParams signInParams);
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<void> sendRecoveryEmail(String email);
  Future<void> signInWithCredentials(AuthCredential credential);
  Future<void> changeEmail(String email);
  Future<void> updatePassword(String password);
  Future<void> updatedProfilePhoto(String url);
  Future<void> sendVerificationEmail([ActionCodeSettings? actionCodeSettings]);
}
