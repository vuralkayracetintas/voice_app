import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/bloc/forget_password/forget_password_bloc.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';

class CustomTextFieldForgetPassword extends StatelessWidget {
  const CustomTextFieldForgetPassword({super.key, required this.controller});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
        builder: (context, state) {
      return TextFormField(
        controller: controller,
        // onChanged: (value) =>
        //     context.read<LoginBloc>().add(LoginUserMailChanged(value)),
        validator: (value) {
          if (value!.isEmpty) {
            return 'E-posta adresi boş bırakılamaz';
          }
          return null;
        },
        cursorColor: Colors.white,
        cursorWidth: 1,
        style: context.general.textTheme.titleMedium?.copyWith(
          color: ColorConstants.colorsWhite,
        ),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          focusColor: Colors.red,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          // enabledBorder: const OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(30)),
          //   borderSide: BorderSide(
          //     color: Colors.grey,
          //   ),
          // ),
          prefixIcon: Padding(
            padding: context.padding.horizontalMedium,
            child: SvgPicture.asset(
              StringConstants.mailSVG,
              height: context.sized.height * 0.03,
              // color: color,
            ),
          ),
          labelText: StringConstants.email,
          labelStyle: context.general.textTheme.titleMedium?.copyWith(
            color: ColorConstants.colorsWhite,
          ),
        ),
      );
    });
  }
}
