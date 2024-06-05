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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVFZEVR-nZiuf7iNibXCNUjGBRM5xdUDE',
    appId: '1:992877680609:ios:d6f8c0293d3fb0e35aa4a0',
    messagingSenderId: '992877680609',
    projectId: 'shoesly-96419',
    databaseURL: 'https://shoesly-96419-default-rtdb.firebaseio.com',
    storageBucket: 'shoesly-96419.appspot.com',
    iosBundleId: 'com.example.shoesly',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0PDdbd9C9YCvWdwiCbnATHi6Fr2MqU8Y',
    appId: '1:992877680609:android:851f7c59a7dfad195aa4a0',
    messagingSenderId: '992877680609',
    projectId: 'shoesly-96419',
    databaseURL: 'https://shoesly-96419-default-rtdb.firebaseio.com',
    storageBucket: 'shoesly-96419.appspot.com',
  );

}