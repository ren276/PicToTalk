// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD8BsPgzSOjJH5YSpgkiSL5_Vy7xd39SBI',
    appId: '1:466414012219:web:bf50a6efac118bc37a991e',
    messagingSenderId: '466414012219',
    projectId: 'pictotalk-44b96',
    authDomain: 'pictotalk-44b96.firebaseapp.com',
    storageBucket: 'pictotalk-44b96.appspot.com',
    measurementId: 'G-G2ME5GVGNK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5xF1C0nacX7ENxO3LkAfv_oBDDOouwxo',
    appId: '1:466414012219:android:a2a5d9acdcc894b77a991e',
    messagingSenderId: '466414012219',
    projectId: 'pictotalk-44b96',
    storageBucket: 'pictotalk-44b96.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_yw22KIX1TQkF4pf5D4S53c5PIFMRAXQ',
    appId: '1:466414012219:ios:c6880800e4276bc27a991e',
    messagingSenderId: '466414012219',
    projectId: 'pictotalk-44b96',
    storageBucket: 'pictotalk-44b96.appspot.com',
    iosBundleId: 'com.example.pictotalk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_yw22KIX1TQkF4pf5D4S53c5PIFMRAXQ',
    appId: '1:466414012219:ios:e0e1a9f044809c147a991e',
    messagingSenderId: '466414012219',
    projectId: 'pictotalk-44b96',
    storageBucket: 'pictotalk-44b96.appspot.com',
    iosBundleId: 'com.example.pictotalk.RunnerTests',
  );
}
