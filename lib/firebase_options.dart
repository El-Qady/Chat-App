
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCwL_wjnnprMLamKuLBWKTkksSjvnv79aU',
    appId: '1:557670865222:web:9dd6ca4b247c38f4acad47',
    messagingSenderId: '557670865222',
    projectId: 'chat-app-a56c2',
    authDomain: 'chat-app-a56c2.firebaseapp.com',
    storageBucket: 'chat-app-a56c2.firebasestorage.app',
    measurementId: 'G-715HNWS9XW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcBN1PSRRMaEnXOrexc3C52hyCliWujPo',
    appId: '1:557670865222:android:ad735e2b442183ccacad47',
    messagingSenderId: '557670865222',
    projectId: 'chat-app-a56c2',
    storageBucket: 'chat-app-a56c2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFGeUrcuzOoNK2XZ8WJCc3ewov5X7izR0',
    appId: '1:557670865222:ios:477c5afb5cbdaeb0acad47',
    messagingSenderId: '557670865222',
    projectId: 'chat-app-a56c2',
    storageBucket: 'chat-app-a56c2.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFGeUrcuzOoNK2XZ8WJCc3ewov5X7izR0',
    appId: '1:557670865222:ios:477c5afb5cbdaeb0acad47',
    messagingSenderId: '557670865222',
    projectId: 'chat-app-a56c2',
    storageBucket: 'chat-app-a56c2.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCwL_wjnnprMLamKuLBWKTkksSjvnv79aU',
    appId: '1:557670865222:web:f0401c30ee121fabacad47',
    messagingSenderId: '557670865222',
    projectId: 'chat-app-a56c2',
    authDomain: 'chat-app-a56c2.firebaseapp.com',
    storageBucket: 'chat-app-a56c2.firebasestorage.app',
    measurementId: 'G-DS28GBKWNE',
  );
}
