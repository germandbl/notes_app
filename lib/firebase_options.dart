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
    apiKey: 'AIzaSyC2Um9RfXwYS7VhihQvhpEyJ2-ootlAz-U',
    appId: '1:1015162692841:web:380f3804f0f922c450fc78',
    messagingSenderId: '1015162692841',
    projectId: 'notes-f9b3f',
    authDomain: 'notes-f9b3f.firebaseapp.com',
    storageBucket: 'notes-f9b3f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOsjF76ngTjtqIkj6YQ5AiGf599Fwn20E',
    appId: '1:1015162692841:android:5164c1629f2aa8a850fc78',
    messagingSenderId: '1015162692841',
    projectId: 'notes-f9b3f',
    storageBucket: 'notes-f9b3f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1-PFEAmvhYsUqGsVn9FVhUU1SBue0XAg',
    appId: '1:1015162692841:ios:ac5d79789534581d50fc78',
    messagingSenderId: '1015162692841',
    projectId: 'notes-f9b3f',
    storageBucket: 'notes-f9b3f.appspot.com',
    iosBundleId: 'com.example.notesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1-PFEAmvhYsUqGsVn9FVhUU1SBue0XAg',
    appId: '1:1015162692841:ios:ac5d79789534581d50fc78',
    messagingSenderId: '1015162692841',
    projectId: 'notes-f9b3f',
    storageBucket: 'notes-f9b3f.appspot.com',
    iosBundleId: 'com.example.notesApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC2Um9RfXwYS7VhihQvhpEyJ2-ootlAz-U',
    appId: '1:1015162692841:web:969680bb0c9a4ab750fc78',
    messagingSenderId: '1015162692841',
    projectId: 'notes-f9b3f',
    authDomain: 'notes-f9b3f.firebaseapp.com',
    storageBucket: 'notes-f9b3f.appspot.com',
  );
}
