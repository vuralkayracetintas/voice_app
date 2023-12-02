import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';

import 'package:voice_app/product/constants/image_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      NavigationService.instance.navigateToPageRemoveAll(path: '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage(
              ImageConstants.ellipseBlur,
            ),
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(ImageConstants.vectorIcon),
                ),
              ),
              SizedBox(
                // height: 40,
                height: context.sized.height * 0.047,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                    StringConstants.splashAppName,
                    textStyle: context.general.textTheme.displaySmall?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
                isRepeatingAnimation: true,
              )
            ],
          ),
        ],
      ),
    );
  }
}
