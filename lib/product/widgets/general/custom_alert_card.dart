import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/product/constants/color_constants.dart';

class CustomAlertCard extends StatelessWidget {
  const CustomAlertCard({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.onPressed,
    required this.buttonText,
  });
  final Image image;
  final Text title;
  final Text desc;
  final Function()? onPressed;
  final Text buttonText;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        backgroundColor: ColorConstants.alertBG,
        title: //const Text('AlertDialog Title'),
            //     const Image(
            //   image: AssetImage(StringConstants.loginSuccess),
            // ),
            image,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            title,
            desc,
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(context.sized.width * 0.8, 50),
                backgroundColor: ColorConstants.colorBlue),
            onPressed: onPressed,
            child: buttonText,
          ),
        ],
      ),
    );
  }
}
