import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/product/widgets/app_icon_widget.dart';
import 'package:voice_app/product/widgets/custom_button.dart';
import 'package:voice_app/product/widgets/signup_text_widget.dart';

class WelcomeLogin extends StatelessWidget {
  const WelcomeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0D0F13),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const AppIconWidget(),
            SizedBox(height: context.sized.height * 0.025),
            Text(
              'Welcome To Voice AI Let\'s Login with your account',
              style: context.general.textTheme.titleSmall
                  ?.copyWith(color: const Color(0xffece1e1)),
            ),
            const Spacer(),
            CustomButton(
              svgPath: 'assets/svg/google.svg',
              description: 'Continue with Google',
              backgroundColor: const Color(0xff1A1E24),
              onPressed: () {},
            ),
            SizedBox(height: context.sized.height * 0.025),
            CustomButton(
              svgPath: 'assets/svg/apple.svg',
              description: 'Continue with Apple',
              svgColor: Colors.white,
              backgroundColor: const Color(0xff1A1E24),
              onPressed: () {},
            ),
            const Spacer(),
            const Divider(color: Color(0xff22262F)),
            CustomButton(
              description: 'Sign In with Mail',
              // svgColor: Color(0xff235dff),
              backgroundColor: const Color(0xff235dff), onPressed: () {},
            ),
            const SignUpTextWidget(),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
