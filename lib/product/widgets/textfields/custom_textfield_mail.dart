import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/bloc/LoginBloc/login_bloc.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';

class CustomTextFormFieldMail extends StatelessWidget {
  const CustomTextFormFieldMail({
    super.key,
  });
  // is login ekle

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginUserMailChanged(value)),
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
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
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
      },
    );
  }
}
