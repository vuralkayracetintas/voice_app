import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/bloc/LoginBloc/login_bloc.dart';
import 'package:voice_app/bloc/RegisterBloc/register_bloc.dart';
import 'package:voice_app/bloc/RegisterBloc/register_state.dart';
import 'package:voice_app/bloc/form_submission_status.dart';
import 'package:voice_app/product/constants/string_constants.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.svgPath,
    // required this.description,
    this.svgColor,
    required this.backgroundColor,
    required this.formKey,
    required this.isLogin,
  });

  final String? svgPath;
  // final String description;
  final Color? svgColor;
  final Color backgroundColor;
  final dynamic formKey;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return state.formStatus is FormSubmitting
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: backgroundColor,
                          //Color(0xff1A1E24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          fixedSize: Size(
                            context.sized.width * 0.9,
                            context.sized.height * 0.07,
                          )),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(LoginSubmitted());
                          print('Login calisti');
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          svgPath != null
                              ? SvgPicture.asset(
                                  svgPath!,
                                  height: context.sized.height * 0.03,
                                  color: svgColor,
                                )
                              : Container(),
                          Padding(padding: context.padding.low),
                          Text(
                            StringConstants.signIn,
                            style: context.general.textTheme.titleSmall
                                ?.copyWith(
                                    color: const Color(0xffFFFFFF),
                                    fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
            },
          )
        : BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
            return state.formStatus is FormSubmitting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundColor,
                        //Color(0xff1A1E24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        fixedSize: Size(
                          context.sized.width * 0.9,
                          context.sized.height * 0.07,
                        )),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<RegisterBloc>().add(RegisterSubmitted());
                        print('register calisti');
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        svgPath != null
                            ? SvgPicture.asset(
                                svgPath!,
                                height: context.sized.height * 0.03,
                                color: svgColor,
                              )
                            : Container(),
                        Padding(padding: context.padding.low),
                        Text(
                          StringConstants.signUp,
                          style: context.general.textTheme.titleSmall?.copyWith(
                              color: const Color(0xffFFFFFF),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ));
          });
  }
}


/*

 color: const Color(0xff1A1E24),
ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: Size(
                    context.sized.width * 0.9,
                    context.sized.height * 0.07,
                  )),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   svgPath != null
              ? SvgPicture.asset(
                  svgPath!,
                  height: context.sized.height * 0.03,
                  color: color,
                )
              : Container(), 
                  Padding(padding: context.padding.low),
                  Text('Continue with Apple'),
                ],
              ),
            )

  */