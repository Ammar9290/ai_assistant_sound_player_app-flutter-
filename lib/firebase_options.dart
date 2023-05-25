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
    apiKey: 'AIzaSyB0gxML5QAfLYWV3_ouHo_5DHGPKqCew4I',
    appId: '1:889000110828:web:6f62d294ccba0b1e6ad3c9',
    messagingSenderId: '889000110828',
    projectId: 'project-ab941',
    authDomain: 'project-ab941.firebaseapp.com',
    storageBucket: 'project-ab941.appspot.com',
    measurementId: 'G-1JP1WQCP0K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDv3HRTB0TRitzCbPPxkbn0reCFpZy1xSY',
    appId: '1:889000110828:android:624ddef4f34079d96ad3c9',
    messagingSenderId: '889000110828',
    projectId: 'project-ab941',
    storageBucket: 'project-ab941.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDX3LkrI0jB3yL2h-82-9Iz0LySRwiETBE',
    appId: '1:889000110828:ios:d89d97c4db44ca216ad3c9',
    messagingSenderId: '889000110828',
    projectId: 'project-ab941',
    storageBucket: 'project-ab941.appspot.com',
    iosClientId: '889000110828-0ho0thmoetaa2msnfsop0kiutm3c4u5v.apps.googleusercontent.com',
    iosBundleId: 'com.example.aiVoiceAssistantSoundPlayerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDX3LkrI0jB3yL2h-82-9Iz0LySRwiETBE',
    appId: '1:889000110828:ios:d89d97c4db44ca216ad3c9',
    messagingSenderId: '889000110828',
    projectId: 'project-ab941',
    storageBucket: 'project-ab941.appspot.com',
    iosClientId: '889000110828-0ho0thmoetaa2msnfsop0kiutm3c4u5v.apps.googleusercontent.com',
    iosBundleId: 'com.example.aiVoiceAssistantSoundPlayerApp',
  );
}