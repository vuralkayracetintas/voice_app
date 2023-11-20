import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/widgets/buttons/auth_button.dart';
import 'package:voice_app/product/widgets/buttons/custom_button.dart';
import 'package:voice_app/product/widgets/textfields/custom_textfield_mail.dart';
import 'package:voice_app/product/widgets/textfields/custom_textfield_password.dart';

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({
    super.key,
    required this.isLogin,
  });

  final GlobalKey _formKey = GlobalKey<FormState>();
  final bool _passwordVisible = false;
  final bool _passwordAgainVisible = false;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            // mail textfield
            SizedBox(
              width: context.sized.width * 0.9,
              child: const CustomTextFormFieldMail(
                isLogin: false,
              ),
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
                isLogin: isLogin,
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
                isLogin: isLogin,
              ),
            ),
            SizedBox(
              height: context.sized.height * 0.022,
              // height: 21,
            ),
            // CustomButton(
            //   description: 'Sign Up',
            //   backgroundColor: ColorConstants.colorBlue,
            //   onPressed: () {},
            // )
            AuthButton(
                backgroundColor: ColorConstants.colorBlue,
                formKey: _formKey,
                isLogin: isLogin)
          ],
        ));
  }
}
