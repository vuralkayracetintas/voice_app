import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:voice_app/firebase_options.dart';

class ApplicationStart {
  const ApplicationStart._();

  static Future<void> initalize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }
}
