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
    apiKey: 'AIzaSyDlYFp_LMue6MKZhIREOBIrgSAqto-Jr9A',
    appId: '1:1084001949014:android:d87744456b59fc40d7b2f7',
    messagingSenderId: '1084001949014',
    projectId: 'todo-list-flutter-2a72b',
    storageBucket: 'todo-list-flutter-2a72b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNebRh5bek4VODf6g2vxVCMNgqhsO6Qdc',
    appId: '1:1084001949014:ios:3f20b78acf96e923d7b2f7',
    messagingSenderId: '1084001949014',
    projectId: 'todo-list-flutter-2a72b',
    storageBucket: 'todo-list-flutter-2a72b.appspot.com',
    androidClientId: '1084001949014-38bkcuhecuk1tkpvjaapb57ua3gdc3jp.apps.googleusercontent.com',
    iosClientId: '1084001949014-2rnkqtv6h8v5rmve2j4cgs9grt116jbe.apps.googleusercontent.com',
    iosBundleId: 'br.com.academiadoflutter.todoList',
  );
}