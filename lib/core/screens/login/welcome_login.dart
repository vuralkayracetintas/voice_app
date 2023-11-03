import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

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
            Spacer(),
            const Image(
              image: AssetImage('assets/images/logo_voice.png'),
              height: 100,
            ),
            SizedBox(height: context.sized.height * 0.025),
            Text(
              'Welcome To Voice AI Let\'s Login with your Account',
              style: context.general.textTheme.titleSmall
                  ?.copyWith(color: const Color(0xffece1e1)),
            ),
            Spacer(),
            const SocialContainer(
              svgPath: 'assets/svg/google.svg',
              description: 'Continue with Google',
            ),
            SizedBox(height: context.sized.height * 0.025),
            const SocialContainer(
              svgPath: 'assets/svg/apple.svg',
              description: 'Continue with Apple',
              color: Colors.white,
            ),
            Spacer(),
            const Divider(color: Color(0xff22262F)),
            const SocialContainer(
              description: 'Sign In with Password',
              color: Color(0xff235dff),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an Account ?',
                    style: context.general.textTheme.titleSmall?.copyWith(
                        color: const Color(0xffFFFFFF),
                        fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: context.general.textTheme.titleSmall?.copyWith(
                          color: const Color(0xff235dff),
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}

class SocialContainer extends StatelessWidget {
  const SocialContainer({
    super.key,
    this.svgPath,
    required this.description,
    this.color,
  });

  final String? svgPath;
  final String description;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sized.width * 0.9,
      height: context.sized.height * 0.07,
      decoration: BoxDecoration(
        color: const Color(0xff1A1E24),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          svgPath != null
              ? SvgPicture.asset(
                  svgPath!,
                  height: context.sized.height * 0.03,
                  color: color,
                )
              : Container(), //,
          Padding(padding: context.padding.low),
          Text(
            // 'Continue with Google',
            description,
            style: context.general.textTheme.titleSmall?.copyWith(
                color: const Color(0xffFFFFFF), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
