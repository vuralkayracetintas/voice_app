import 'package:flutter/material.dart';
import 'package:voice_app/core/screens/login/sign_in_mail.dart';
import 'package:voice_app/core/screens/login/welcome_login.dart';

class NavigationRoute {
  NavigationRoute._init();
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const WelcomeLogin());
      case '/sign_in_mail':
        return MaterialPageRoute(builder: (context) => const SignInMail());
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Container(),
        );
    }
  }
}
