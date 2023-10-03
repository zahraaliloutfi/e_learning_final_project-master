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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLqVlrjyhOFA7W2Y5IlMcghnb0O8JtbHM',
    appId: '1:685720373066:android:991175cab7d94498b4e3b3',
    messagingSenderId: '685720373066',
    projectId: 'advanced-final-project',
    storageBucket: 'advanced-final-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVp-Zf_-69_Y6iWEEe_tY2TYEXa6gRC-g',
    appId: '1:685720373066:ios:3ee576973884d4b9b4e3b3',
    messagingSenderId: '685720373066',
    projectId: 'advanced-final-project',
    storageBucket: 'advanced-final-project.appspot.com',
    androidClientId: '685720373066-co62jedcrloh94shkfsnhavlfom7h0ud.apps.googleusercontent.com',
    iosClientId: '685720373066-49fnduga0np75d8u0bsqqurep0gqocn7.apps.googleusercontent.com',
    iosBundleId: 'com.example.eLearningFinalProject',
  );
}