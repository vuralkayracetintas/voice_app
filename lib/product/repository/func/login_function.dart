import 'package:firebase_auth/firebase_auth.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';
import 'package:voice_app/product/service/auth_service.dart';

class LoginFunction {
  Future<void> isLoginGoogle() async {
    UserCredential? userCredential = await AuthServices().signInWithGoogle();
    if (userCredential != null) {
      NavigationService.instance.navigateToPageRemoveAll(path: '/home');
    }
  }

  Future<void> isLoginApple() async {
    UserCredential? userCredential = await AuthServices().signInWithApple();
    if (userCredential != null) {
      NavigationService.instance.navigateToPageRemoveAll(path: '/home');
    }
  }
}
