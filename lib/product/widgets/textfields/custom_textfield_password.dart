import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/bloc/LoginBloc/login_bloc.dart';
import 'package:voice_app/bloc/RegisterBloc/register_bloc.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';

class CustomTextFieldPassword extends StatefulWidget {
  CustomTextFieldPassword({
    super.key,
    required this.passwordVisible,
    required this.isLogin,
  });

  bool passwordVisible;
  final bool isLogin;

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return widget.isLogin
        ? BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) =>
                    context.read<LoginBloc>().add(LoginPasswordChanged(value)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Sifre  boş bırakılamaz';
                  }
                  return null;
                },
                cursorColor: Colors.white,
                cursorWidth: 1,
                keyboardType: TextInputType.visiblePassword,
                style: context.general.textTheme.titleMedium?.copyWith(
                  color: ColorConstants.colorsWhite,
                ),
                obscureText: !widget.passwordVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.passwordVisible = !widget.passwordVisible;
                      });
                    },
                    icon: Icon(
                      widget.passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: ColorConstants.colorsWhite,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: context.padding.horizontalMedium,
                    child: SvgPicture.asset(
                      StringConstants.passwordSVH,
                      height: context.sized.height * 0.03,
                      // color: color,
                    ),
                  ),
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
                  labelText: StringConstants.password,
                  labelStyle: context.general.textTheme.titleMedium?.copyWith(
                    color: ColorConstants.colorsWhite,
                  ),
                ),
              );
            },
          )
        : BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return TextFormField(
                onChanged: (value) => context
                    .read<RegisterBloc>()
                    .add(RegisterPasswordChanged(value)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Sifre  boş bırakılamaz';
                  }
                  return null;
                },
                cursorColor: Colors.white,
                cursorWidth: 1,
                keyboardType: TextInputType.visiblePassword,
                style: context.general.textTheme.titleMedium?.copyWith(
                  color: ColorConstants.colorsWhite,
                ),
                obscureText: !widget.passwordVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.passwordVisible = !widget.passwordVisible;
                      });
                    },
                    icon: Icon(
                      widget.passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: ColorConstants.colorsWhite,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: context.padding.horizontalMedium,
                    child: SvgPicture.asset(
                      StringConstants.passwordSVH,
                      height: context.sized.height * 0.03,
                      // color: color,
                    ),
                  ),
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
                  labelText: StringConstants.password,
                  labelStyle: context.general.textTheme.titleMedium?.copyWith(
                    color: ColorConstants.colorsWhite,
                  ),
                ),
              );
            },
          );
  }
}
