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
      validator: (value) {
        if (value!.isEmpty) {
          return 'E-posta adresi boş bırakılamaz';
        }
        // Diğer validation kuralları buraya eklenebilir.
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
            widget.passwordVisible ? Icons.visibility : Icons.visibility_off,
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
  }
}
