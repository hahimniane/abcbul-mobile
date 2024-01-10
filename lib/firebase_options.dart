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
    apiKey: 'AIzaSyAkSZhqLNcN7C0u-x1DevXKqTc5g2M8ot8',
    appId: '1:624523047238:web:ae8d6b5ce613aba87ef547',
    messagingSenderId: '624523047238',
    projectId: 'abcbul-c49d9',
    authDomain: 'abcbul-c49d9.firebaseapp.com',
    storageBucket: 'abcbul-c49d9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDl1UtbeS12_scxeT0nTvQKKAf4vi9U1Ts',
    appId: '1:624523047238:android:76bf8ce0b696d2a87ef547',
    messagingSenderId: '624523047238',
    projectId: 'abcbul-c49d9',
    storageBucket: 'abcbul-c49d9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzEB8AEifmlV-h6FXzhdFxlsC-N-ZGwQw',
    appId: '1:624523047238:ios:e9ed2882fe8c1d237ef547',
    messagingSenderId: '624523047238',
    projectId: 'abcbul-c49d9',
    storageBucket: 'abcbul-c49d9.appspot.com',
    iosBundleId: 'com.abcbul.ios',
  );
}
