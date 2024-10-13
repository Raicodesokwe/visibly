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
    apiKey: 'AIzaSyAn4nMw_1qcrpkYQ-uxNv4mM0wt-EfqhqA',
    appId: '1:221556031216:web:da9d65aa30051ef1b20c35',
    messagingSenderId: '221556031216',
    projectId: 'visibly-4c9bb',
    authDomain: 'visibly-4c9bb.firebaseapp.com',
    storageBucket: 'visibly-4c9bb.appspot.com',
    measurementId: 'G-TWESXXFJZ0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1CVR3PL4a_xcn2BjnmdpqkMVwb0oJAwk',
    appId: '1:221556031216:android:667a36ed6bcf26afb20c35',
    messagingSenderId: '221556031216',
    projectId: 'visibly-4c9bb',
    storageBucket: 'visibly-4c9bb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9l4cawZtH1UVfFA6NOSr-EhJSmY3JUC0',
    appId: '1:221556031216:ios:7578c1c3b406d61ab20c35',
    messagingSenderId: '221556031216',
    projectId: 'visibly-4c9bb',
    storageBucket: 'visibly-4c9bb.appspot.com',
    iosBundleId: 'com.example.visibly',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9l4cawZtH1UVfFA6NOSr-EhJSmY3JUC0',
    appId: '1:221556031216:ios:7578c1c3b406d61ab20c35',
    messagingSenderId: '221556031216',
    projectId: 'visibly-4c9bb',
    storageBucket: 'visibly-4c9bb.appspot.com',
    iosBundleId: 'com.example.visibly',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAn4nMw_1qcrpkYQ-uxNv4mM0wt-EfqhqA',
    appId: '1:221556031216:web:134fcd959cfc018bb20c35',
    messagingSenderId: '221556031216',
    projectId: 'visibly-4c9bb',
    authDomain: 'visibly-4c9bb.firebaseapp.com',
    storageBucket: 'visibly-4c9bb.appspot.com',
    measurementId: 'G-Z07B7GXJ6X',
  );
}