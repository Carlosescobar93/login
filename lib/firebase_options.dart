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
    apiKey: 'AIzaSyAWHDArNpoth3p4WGg7es7cpoOJE_Bd9z8',
    appId: '1:666263528864:web:f92dd249ff41b01f0230c5',
    messagingSenderId: '666263528864',
    projectId: 'prueba-8fd59',
    authDomain: 'prueba-8fd59.firebaseapp.com',
    storageBucket: 'prueba-8fd59.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBv0hthe5vDvgQqbmvAvhrYNl_3wESkOyk',
    appId: '1:666263528864:android:7a8b4c79ef20ae880230c5',
    messagingSenderId: '666263528864',
    projectId: 'prueba-8fd59',
    storageBucket: 'prueba-8fd59.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAX45X-Vdi3a08FTlea_VUuv4DAdycApPg',
    appId: '1:666263528864:ios:923cd1d5f3752ec80230c5',
    messagingSenderId: '666263528864',
    projectId: 'prueba-8fd59',
    storageBucket: 'prueba-8fd59.firebasestorage.app',
    iosBundleId: 'com.example.prueba',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAX45X-Vdi3a08FTlea_VUuv4DAdycApPg',
    appId: '1:666263528864:ios:923cd1d5f3752ec80230c5',
    messagingSenderId: '666263528864',
    projectId: 'prueba-8fd59',
    storageBucket: 'prueba-8fd59.firebasestorage.app',
    iosBundleId: 'com.example.prueba',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAWHDArNpoth3p4WGg7es7cpoOJE_Bd9z8',
    appId: '1:666263528864:web:d38144544fc0d8f10230c5',
    messagingSenderId: '666263528864',
    projectId: 'prueba-8fd59',
    authDomain: 'prueba-8fd59.firebaseapp.com',
    storageBucket: 'prueba-8fd59.firebasestorage.app',
  );
}
