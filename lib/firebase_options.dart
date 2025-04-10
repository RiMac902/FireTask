// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDQQPCcpNJKqCZ-klThcf-DdUrXNlTm-nk',
    appId: '1:290523469651:web:843e67756ab0e13dbbb3a6',
    messagingSenderId: '290523469651',
    projectId: 'firetask-fa5bf',
    authDomain: 'firetask-fa5bf.firebaseapp.com',
    storageBucket: 'firetask-fa5bf.firebasestorage.app',
    measurementId: 'G-QSKE5DGJQ1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBf0JQFb9TjzkOFngCIFnke2or7kkaWU_I',
    appId: '1:290523469651:android:083f75ece5ea72f7bbb3a6',
    messagingSenderId: '290523469651',
    projectId: 'firetask-fa5bf',
    storageBucket: 'firetask-fa5bf.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWvsR3KphUaoYFsjYRztBAqFAGlLUFFhY',
    appId: '1:290523469651:ios:c95d55a29217fbf5bbb3a6',
    messagingSenderId: '290523469651',
    projectId: 'firetask-fa5bf',
    storageBucket: 'firetask-fa5bf.firebasestorage.app',
    iosBundleId: 'com.example.fireTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWvsR3KphUaoYFsjYRztBAqFAGlLUFFhY',
    appId: '1:290523469651:ios:c95d55a29217fbf5bbb3a6',
    messagingSenderId: '290523469651',
    projectId: 'firetask-fa5bf',
    storageBucket: 'firetask-fa5bf.firebasestorage.app',
    iosBundleId: 'com.example.fireTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDQQPCcpNJKqCZ-klThcf-DdUrXNlTm-nk',
    appId: '1:290523469651:web:31a60a65c2c2ecc5bbb3a6',
    messagingSenderId: '290523469651',
    projectId: 'firetask-fa5bf',
    authDomain: 'firetask-fa5bf.firebaseapp.com',
    storageBucket: 'firetask-fa5bf.firebasestorage.app',
    measurementId: 'G-FXDRX8ZVN8',
  );
}
