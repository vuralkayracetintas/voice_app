import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/widgets/custom_button.dart';
import 'package:voice_app/product/widgets/custom_textfield_mail.dart';
import 'package:voice_app/product/widgets/custom_textfield_password.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final bool _passwordVisible = false;
  final bool _passwordAgainVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            NavigationService.instance.navigateToBack();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorConstants.colorsWhite,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            // mail textfield
            SizedBox(
              width: context.sized.width * 0.9,
              child: const CustomTextFormFieldMail(),
            ),
            SizedBox(
              height: context.sized.height * 0.022,
              // height: 21,
            ),
            //password textfiled
            SizedBox(
              width: context.sized.width * 0.9,
              child: CustomTextFieldPassword(
                passwordVisible: _passwordVisible,
              ),
            ),
            SizedBox(
              height: context.sized.height * 0.022,
              // height: 21,
            ),
            // password again textfield
            SizedBox(
              width: context.sized.width * 0.9,
              child: CustomTextFieldPassword(
                passwordVisible: _passwordAgainVisible,
              ),
            ),
            SizedBox(
              height: context.sized.height * 0.022,
              // height: 21,
            ),
            CustomButton(
              description: 'Sign Up',
              backgroundColor: ColorConstants.colorBlue,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
