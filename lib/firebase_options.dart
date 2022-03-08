// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDCQe2DbYddCtYNxvmwUfBL_yGTCYqP0QY',
    appId: '1:418242537534:web:c5c518820b4c988303896f',
    messagingSenderId: '418242537534',
    projectId: 'farmers-2e1fe',
    authDomain: 'farmers-2e1fe.firebaseapp.com',
    databaseURL: 'https://farmers-2e1fe-default-rtdb.firebaseio.com',
    storageBucket: 'farmers-2e1fe.appspot.com',
    measurementId: 'G-M15TZ72D66',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB23J13OgSyolZFV8pXCZdwU9PpyNx1FfM',
    appId: '1:418242537534:android:a9a3517b7bf4c44b03896f',
    messagingSenderId: '418242537534',
    projectId: 'farmers-2e1fe',
    databaseURL: 'https://farmers-2e1fe-default-rtdb.firebaseio.com',
    storageBucket: 'farmers-2e1fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfMfXhijIQGW5jB1b3AJ5YL62He-vYb-0',
    appId: '1:418242537534:ios:a30b881634b9843a03896f',
    messagingSenderId: '418242537534',
    projectId: 'farmers-2e1fe',
    databaseURL: 'https://farmers-2e1fe-default-rtdb.firebaseio.com',
    storageBucket: 'farmers-2e1fe.appspot.com',
    iosClientId: '418242537534-uq09muncn2441sc313ul7m4uaucb3gpa.apps.googleusercontent.com',
    iosBundleId: 'com.example.farmers',
  );
}