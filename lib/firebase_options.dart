// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
// /// ```dart
// await Firebase.initializeApp(
//     options = DefaultFirebaseOptions.currentPlatform,
// );
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
    apiKey: 'AIzaSyDGPtAQwV_FlUPexNAQl3hEkZcxC7kJK3w',
    appId: '1:403201579600:web:4e9ea286094fdb06d98f55',
    messagingSenderId: '403201579600',
    projectId: 'expense-tracker-60d62',
    authDomain: 'expense-tracker-60d62.firebaseapp.com',
    storageBucket: 'expense-tracker-60d62.appspot.com',
    measurementId: 'G-S65BPZH7LB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjpY83pHoj8eP0qKBJUVS7kHVHgLRhQ9c',
    appId: '1:403201579600:android:499a6c9ae90fca93d98f55',
    messagingSenderId: '403201579600',
    projectId: 'expense-tracker-60d62',
    storageBucket: 'expense-tracker-60d62.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKGQOV7YT0611t9ltQxOQU4ZfioPHWxkQ',
    appId: '1:403201579600:ios:8a6f5d0d614b4acdd98f55',
    messagingSenderId: '403201579600',
    projectId: 'expense-tracker-60d62',
    storageBucket: 'expense-tracker-60d62.appspot.com',
    iosBundleId: 'com.example.expenseTrackerFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKGQOV7YT0611t9ltQxOQU4ZfioPHWxkQ',
    appId: '1:403201579600:ios:8a6f5d0d614b4acdd98f55',
    messagingSenderId: '403201579600',
    projectId: 'expense-tracker-60d62',
    storageBucket: 'expense-tracker-60d62.appspot.com',
    iosBundleId: 'com.example.expenseTrackerFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDGPtAQwV_FlUPexNAQl3hEkZcxC7kJK3w',
    appId: '1:403201579600:web:ed6b382bc036cbb6d98f55',
    messagingSenderId: '403201579600',
    projectId: 'expense-tracker-60d62',
    authDomain: 'expense-tracker-60d62.firebaseapp.com',
    storageBucket: 'expense-tracker-60d62.appspot.com',
    measurementId: 'G-7ECYHT6CRK',
  );
}
