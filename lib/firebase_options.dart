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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCIeVmS3R6XGcD6tdbjDCZDS2MJH2NBNfw',
    appId: '1:577717935228:web:dd33a0a76459bb186f3df9',
    messagingSenderId: '577717935228',
    projectId: 'weather-app-liv',
    authDomain: 'weather-app-liv.firebaseapp.com',
    storageBucket: 'weather-app-liv.appspot.com',
    measurementId: 'G-BZ3G7FN4LF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASpJ9Y1Sob7JNdWbqsn3kh5fm2WuIuKMo',
    appId: '1:577717935228:android:bfa5217a14801f6e6f3df9',
    messagingSenderId: '577717935228',
    projectId: 'weather-app-liv',
    storageBucket: 'weather-app-liv.appspot.com',
  );
}
