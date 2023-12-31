import 'package:flutter/material.dart';
import 'package:voice_app/core/screens/forget_password/forget_password.dart';
import 'package:voice_app/core/screens/login/sign_in_mail.dart';
import 'package:voice_app/core/screens/login/welcome_login.dart';
import 'package:voice_app/core/screens/signup/sign_up.dart';
import 'package:voice_app/core/screens/splash/splash_screen.dart';
import 'package:voice_app/main.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case '/welcome':
        return MaterialPageRoute(builder: (context) => const WelcomeLogin());
      case '/sign_in_mail':
        return MaterialPageRoute(builder: (context) => const SignInMail());

      case '/sign_up':
        return MaterialPageRoute(builder: (context) => const SignUp());

      // case '/home':
      //   return MaterialPageRoute(builder: (context) => const MyHomePage());
      case '/forget-password':
        return MaterialPageRoute(builder: (context) => ForgetPassword());
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Container(),
        );
    }
  }
}
