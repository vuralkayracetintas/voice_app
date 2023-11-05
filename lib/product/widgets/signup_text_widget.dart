import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';

class SignUpTextWidget extends StatelessWidget {
  const SignUpTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(StringConstants.dontAccount,
            style: context.general.textTheme.titleSmall?.copyWith(
                color: ColorConstants.colorsWhite,
                fontWeight: FontWeight.bold)),
        TextButton(
            onPressed: () {
              NavigationService.instance.navigateToPage(path: '/sign_up');
            },
            child: Text(
              StringConstants.signUp,
              style: context.general.textTheme.titleSmall?.copyWith(
                  color: ColorConstants.colorBlue, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
