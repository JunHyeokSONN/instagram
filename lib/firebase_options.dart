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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAM0-0Otox-2BOKBvevSkNtxufm1qc8jH0',
    appId: '1:298089253389:web:bf6f72e6e6c7ee0df9e344',
    messagingSenderId: '298089253389',
    projectId: 'fluttergram-1746e',
    authDomain: 'fluttergram-1746e.firebaseapp.com',
    storageBucket: 'fluttergram-1746e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJ4kLm6BjGhfRU-IYQY4BEyJ-bOIhEh8s',
    appId: '1:298089253389:android:f240c60de457cad6f9e344',
    messagingSenderId: '298089253389',
    projectId: 'fluttergram-1746e',
    storageBucket: 'fluttergram-1746e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8pd_Bilaz-l6_9AIrUwe6dFbcaqSrlOo',
    appId: '1:298089253389:ios:e1423e9c0d11976df9e344',
    messagingSenderId: '298089253389',
    projectId: 'fluttergram-1746e',
    storageBucket: 'fluttergram-1746e.appspot.com',
    iosBundleId: 'com.JHS.fluttergram',
  );
}