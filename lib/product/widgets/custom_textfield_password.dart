import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';

class CustomTextFieldPassword extends StatefulWidget {
  CustomTextFieldPassword({
    super.key,
    required this.passwordVisible,
  });

  bool passwordVisible;

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
            // Based on passwordVisible state choose the icon
            widget.passwordVisible ? Icons.visibility : Icons.visibility_off,
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
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        labelText: StringConstants.password,
      ),
    );
  }
}
