import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';

class RememberForgetPasswordWidget extends StatefulWidget {
  const RememberForgetPasswordWidget({
    super.key,
  });

  @override
  State<RememberForgetPasswordWidget> createState() =>
      _RememberForgetPasswordWidgetState();
}

class _RememberForgetPasswordWidgetState
    extends State<RememberForgetPasswordWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
              print('checked');
            });
          },
        ),
        Text(
          StringConstants.remember,
          style: context.general.textTheme.titleSmall?.copyWith(
            color: const Color(0xffFFFFFF),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            StringConstants.forgetPass,
            style: context.general.textTheme.titleSmall?.copyWith(
              color: ColorConstants.colorBlue,
            ),
          ),
        ),
      ],
    );
  }
}
