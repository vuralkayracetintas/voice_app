import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';
import 'package:voice_app/product/widgets/app_icon_widget.dart';
import 'package:voice_app/product/widgets/custom_button.dart';
import 'package:voice_app/product/widgets/custom_social_button.dart';
import 'package:voice_app/product/widgets/custom_textfield_mail.dart';
import 'package:voice_app/product/widgets/custom_textfield_password.dart';
import 'package:voice_app/product/widgets/divider_or_widget.dart';
import 'package:voice_app/product/widgets/remember_forget_password_widget.dart';
import 'package:voice_app/product/widgets/signup_text_widget.dart';
import 'package:voice_app/product/widgets/social_button_widgets.dart';

class SignInMail extends StatefulWidget {
  const SignInMail({super.key});

  @override
  State<SignInMail> createState() => _SignInMailState();
}

class _SignInMailState extends State<SignInMail> {
  final bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff0D0F13),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            NavigationService.instance.navigateToBack();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorConstants.colorsWhite,
        ),
        title: Text(
          StringConstants.signIn,
          style: context.general.textTheme.bodyLarge
              ?.copyWith(color: ColorConstants.colorsWhite),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const AppIconWidget(),
            Text(
              StringConstants.welcomeApp,
              style: context.general.textTheme.titleLarge?.copyWith(
                color: ColorConstants.colorsWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              StringConstants.enterMailDesc,
              style: context.general.textTheme.titleSmall?.copyWith(
                color: ColorConstants.colorsWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            //mail textfield
            SizedBox(
              width: context.sized.width * 0.9,
              child: const CustomTextFormFieldMail(),
            ),
            SizedBox(
              height: context.sized.height * 0.022,
              // height: 21,
            ),
            //password textfielda
            SizedBox(
              width: context.sized.width * 0.9,
              child: CustomTextFieldPassword(passwordVisible: _passwordVisible),
            ),
            RememberForgetPasswordWidget(),
            const Spacer(),
            CustomButton(
              description: StringConstants.signIn,
              backgroundColor: ColorConstants.colorBlue,
              onPressed: () {},
            ),
            const Spacer(),
            const DividerOrWidget(),
            const Spacer(),
            const SocialLoginButtonWidgets(),
            const Spacer(),
            const SignUpTextWidget(),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
