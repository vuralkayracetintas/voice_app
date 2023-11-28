import 'package:flutter/material.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';
import 'package:voice_app/product/repository/func/login_function.dart';
import 'package:voice_app/product/widgets/buttons/custom_social_button.dart';

class SocialLoginButtonWidgets extends StatelessWidget {
  const SocialLoginButtonWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginFunction login = LoginFunction();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomSocialButton(
          backgroundColor: ColorConstants.darkBtnColor,
          onPressed: () {
            login.isLoginGoogle();
          },
          svgPath: StringConstants.googleSVG,
        ),
        CustomSocialButton(
          backgroundColor: ColorConstants.darkBtnColor,
          onPressed: () {
            login.isLoginApple();
          },
          svgPath: StringConstants.appleSVG,
        ),
      ],
    );
  }
}
