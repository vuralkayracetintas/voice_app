import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/repository/auth/auth_repository.dart';
import 'package:voice_app/product/widgets/buttons/custom_button.dart';
import 'package:voice_app/product/widgets/textfields/custom_textfield_forget_password.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    void dispose() {
      controller.dispose();

      super.dispose();
    }

    Future<void> passwordReset() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: controller.text.trim());
      } on FirebaseAuthException catch (e) {
        print('error: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password',
            // style: TextStyle(color: ColorConstants.colorsWhite),
            style: context.general.textTheme.titleMedium?.copyWith(
              color: ColorConstants.colorsWhite,
              // fontSize: 20,
            )),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.sized.dynamicHeight(0.04),
            ),
            Text(
              'Reset Password 🔑',
              style: context.general.textTheme.headlineSmall?.copyWith(
                color: ColorConstants.colorsWhite,
              ),
            ),
            SizedBox(
              height: context.sized.dynamicHeight(0.01),
            ),
            Text(
              'Enter your email to Reset Password',
              style: context.general.textTheme.titleSmall?.copyWith(
                color: ColorConstants.colorsWhite,
              ),
            ),
            SizedBox(
              height: context.sized.dynamicHeight(0.04),
            ),
            Padding(
              padding: context.padding.low,
              child: CustomTextFieldForgetPassword(
                controller: controller,
              ),
            ),
            SizedBox(
              height: context.sized.dynamicHeight(0.02),
            ),
            // TextField(
            //     controller: emailController,
            //     decoration: InputDecoration(labelText: 'E-posta'),
            //     keyboardType: TextInputType.emailAddress,
            //     style: context.general.textTheme.titleMedium?.copyWith(
            //       color: ColorConstants.colorsWhite,
            //     )),
            CustomButton(
              description: 'Send Code',
              backgroundColor: ColorConstants.colorBlue,
              onPressed: () {
                passwordReset();
              },
            ),
          ],
        ),
      ),
    );
  }
}
