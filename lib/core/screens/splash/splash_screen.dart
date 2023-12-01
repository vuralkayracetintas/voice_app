import 'package:flutter/material.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';
import 'package:voice_app/product/constants/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      NavigationService.instance.navigateToPageRemoveAll(path: '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(
              'assets/images/ellipse_blur.png',
            ),
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(ImageConstants.splashIcon),
            ),
          ),
        ],
      ),
    );
  }
}
