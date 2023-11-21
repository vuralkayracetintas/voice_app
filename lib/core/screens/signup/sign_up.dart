import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:voice_app/bloc/RegisterBloc/register_bloc.dart';
import 'package:voice_app/bloc/RegisterBloc/register_state.dart';
import 'package:voice_app/bloc/form_submission_status.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';

import 'package:voice_app/product/constants/color_constants.dart';

import 'package:voice_app/product/repository/auth/repository_store.dart';

import 'package:voice_app/product/widgets/general/sign_up_form_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context) =>
                RegisterBloc(authRepo: RepositoryStore.authRepository),
            child: BlocListener<RegisterBloc, RegisterState>(
              listenWhen: (previous, current) =>
                  previous.formStatus != current.formStatus,
              listener: (context, state) {
                final formStatus = state.formStatus;

                if (formStatus is SubmissionFailed) {
                  _showSnackBar(context, formStatus.exception.toString());
                }

                if (formStatus is SubmissionSuccess) {
                  // _goToWelcome(context);
                }
              },
              child: Center(
                child: SignUpFormWidget(
                  isLogin: false,
                ),
              ),
            ),
          ),
        ));
  }
}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// void _goToWelcome(BuildContext context) {
//   Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => const MyWidgetDemo()),
//       (route) => false);
// }
