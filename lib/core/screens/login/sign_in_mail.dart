import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/bloc/LoginBloc/login_bloc.dart';
import 'package:voice_app/bloc/form_submission_status.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';
import 'package:voice_app/product/repository/auth/repository_store.dart';
import 'package:voice_app/product/widgets/general/custom_alert_card.dart';
import 'package:voice_app/product/widgets/icon/app_icon_widget.dart';
import 'package:voice_app/product/widgets/general/divider_or_widget.dart';
import 'package:voice_app/product/widgets/general/login_form_widget.dart';
import 'package:voice_app/product/widgets/text/signup_text_widget.dart';
import 'package:voice_app/product/widgets/buttons/social_button_widgets.dart';

class SignInMail extends StatefulWidget {
  const SignInMail({super.key});

  @override
  State<SignInMail> createState() => _SignInMailState();
}

class _SignInMailState extends State<SignInMail> {
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
      body: BlocProvider(
        create: (context) =>
            LoginBloc(authRepo: RepositoryStore.authRepository),
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (((previous, current) =>
              previous.formStatus != current.formStatus)),
          listener: (context, state) {
            final formStatus = state.formStatus;
            if (formStatus is SubmissionFailed) {
              _showSnackbar(context, formStatus.exception.toString());
            }
            if (formStatus is SubmissionSuccess) {
              showLoginSuccess(context);
            }
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const Spacer(),
                  SizedBox(height: context.sized.height * 0.025),
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
                  // const Spacer(),
                  SizedBox(height: context.sized.height * 0.025),
                  //mail textfield`
                  LoginFormWidget(
                    isLogin: true,
                  ),
                  // const Spacer(),
                  SizedBox(height: context.sized.height * 0.025),
                  const DividerOrWidget(),
                  SizedBox(height: context.sized.height * 0.025),
                  // const Spacer(),
                  const SocialLoginButtonWidgets(),
                  // const Spacer(),
                  SizedBox(height: context.sized.height * 0.025),
                  // SizedBox(height: context.sized.height * 0.025),
                  const SignUpTextWidget(),
                  // const Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

void showLoginSuccess(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertCard(
          image: const Image(
            image: AssetImage(StringConstants.loginSuccess),
          ),
          title: Text(
            StringConstants.signInSuccess,
            style: context.general.textTheme.titleLarge?.copyWith(
                color: ColorConstants.colorsWhite, fontWeight: FontWeight.bold),
          ),
          desc: Text(
            StringConstants.successDesc,
            style: context.general.textTheme.titleSmall?.copyWith(
              color: ColorConstants.colorsWhite,
            ),
          ),
          onPressed: () {
            NavigationService.instance.navigateToPageRemoveAll(path: '/home');
          },
          buttonText: Text(
            StringConstants.continueHome,
            style: context.general.textTheme.titleMedium?.copyWith(
              color: ColorConstants.colorsWhite,
            ),
          ),
        );
      });
}
