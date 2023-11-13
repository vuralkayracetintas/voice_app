import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';

class CustomTextFormFieldMail extends StatelessWidget {
  const CustomTextFormFieldMail({
    super.key,
  });

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
  }
}
