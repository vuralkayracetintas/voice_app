import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';
import 'package:voice_app/product/widgets/textfields/custom_textfield_mail.dart';
import 'package:voice_app/product/widgets/textfields/custom_textfield_password.dart';
import 'package:voice_app/product/widgets/buttons/auth_button.dart';
import 'package:voice_app/product/widgets/general/remember_forget_password_widget.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({super.key, required this.isLogin});
  final bool _passwordVisible = false;
  final bool isLogin;
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: context.sized.width * 0.9,
            child: CustomTextFormFieldMail(
              isLogin: isLogin,
            ),
          ),
          SizedBox(
            height: context.sized.height * 0.022,
            // height: 21,
          ),

          //password textfielda
          SizedBox(
            width: context.sized.width * 0.9,
            child: CustomTextFieldPassword(
              passwordVisible: _passwordVisible,
              isLogin: isLogin,
            ),
          ),
          const RememberForgetPasswordWidget(),
          // const Spacer(),
          AuthButton(
            // description: StringConstants.signIn,
            backgroundColor: ColorConstants.colorBlue,
            formKey: _formKey,
            isLogin: isLogin,
          ),
        ],
      ),
    );
  }
}
