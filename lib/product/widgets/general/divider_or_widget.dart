import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/product/constants/color_constants.dart';

class DividerOrWidget extends StatelessWidget {
  const DividerOrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 2,
          width: context.sized.width * 0.4,
          color: ColorConstants.colorsWhite,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
        const Text(
          'OR',
          style: TextStyle(
            color: ColorConstants.colorsWhite,
          ),
        ),
        Container(
          height: 2,
          width: context.sized.width * 0.4,
          color: ColorConstants.colorsWhite,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ],
    );
  }
}
