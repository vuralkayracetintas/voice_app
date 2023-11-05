import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';
import 'package:voice_app/product/widgets/app_icon_widget.dart';
import 'package:voice_app/product/widgets/custom_button.dart';
import 'package:voice_app/product/widgets/signup_text_widget.dart';

class WelcomeLogin extends StatelessWidget {
  const WelcomeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff0D0F13),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const AppIconWidget(),
            SizedBox(height: context.sized.height * 0.025),
            Text(
              StringConstants.welcomeTitle,
              style: context.general.textTheme.titleSmall
                  ?.copyWith(color: ColorConstants.colorGrey2),
            ),
            const Spacer(),
            CustomButton(
              svgPath: StringConstants.googleSVG,
              description: StringConstants.continueGoogle,
              backgroundColor: ColorConstants.darkBtnColor,
              onPressed: () {},
            ),
            SizedBox(height: context.sized.height * 0.025),
            CustomButton(
              svgPath: StringConstants.appleSVG,
              description: StringConstants.continueApple,
              svgColor: Colors.white,
              backgroundColor: ColorConstants.darkBtnColor,
              onPressed: () {},
            ),
            const Spacer(),
            const Divider(color: ColorConstants.dividerColor),
            CustomButton(
              description: StringConstants.signInMail,
              backgroundColor: ColorConstants.colorBlue,
              onPressed: () {
                NavigationService.instance
                    .navigateToPage(path: '/sign_in_mail');
              },
            ),
            const SignUpTextWidget(),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
