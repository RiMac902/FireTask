import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

@module
abstract class FirebaseModule {
  @Named('firestore')
  @singleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @Named('auth')
  @singleton
  FirebaseAuth get auth => FirebaseAuth.instance;
}
