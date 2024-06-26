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
    apiKey: 'AIzaSyCrbxK5zycjxcd9YQHPa3CMbF5ypS43J9g',
    appId: '1:133059021035:web:7998e832cd026d6c2c16ae',
    messagingSenderId: '133059021035',
    projectId: 'book-summary-pro',
    authDomain: 'book-summary-pro.firebaseapp.com',
    storageBucket: 'book-summary-pro.appspot.com',
    measurementId: 'G-DDZ1R90781',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkBUP6Ql77kI6uIDQZzUrzOQ6Zcrr8fuI',
    appId: '1:133059021035:android:2ffccef27dd6ae842c16ae',
    messagingSenderId: '133059021035',
    projectId: 'book-summary-pro',
    storageBucket: 'book-summary-pro.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzUjVRYZyVHuXfraS9zceTNPoQNzSPGz8',
    appId: '1:133059021035:ios:393ac2281abd424b2c16ae',
    messagingSenderId: '133059021035',
    projectId: 'book-summary-pro',
    storageBucket: 'book-summary-pro.appspot.com',
    iosBundleId: 'com.example.booksDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzUjVRYZyVHuXfraS9zceTNPoQNzSPGz8',
    appId: '1:133059021035:ios:393ac2281abd424b2c16ae',
    messagingSenderId: '133059021035',
    projectId: 'book-summary-pro',
    storageBucket: 'book-summary-pro.appspot.com',
    iosBundleId: 'com.example.booksDemo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCrbxK5zycjxcd9YQHPa3CMbF5ypS43J9g',
    appId: '1:133059021035:web:90f4d8185f64c8492c16ae',
    messagingSenderId: '133059021035',
    projectId: 'book-summary-pro',
    authDomain: 'book-summary-pro.firebaseapp.com',
    storageBucket: 'book-summary-pro.appspot.com',
    measurementId: 'G-L3421WXC54',
  );

}