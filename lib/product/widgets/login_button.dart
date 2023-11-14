import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/bloc/LoginBloc/login_bloc.dart';
import 'package:voice_app/bloc/form_submission_status.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    this.svgPath,
    required this.description,
    this.svgColor,
    required this.backgroundColor,
    required this.formKey,
  });

  final String? svgPath;
  final String description;
  final Color? svgColor;
  final Color backgroundColor;
  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
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
                    print('buton calisti');
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
                      description,
                      style: context.general.textTheme.titleSmall?.copyWith(
                          color: const Color(0xffFFFFFF),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
      },
    );
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