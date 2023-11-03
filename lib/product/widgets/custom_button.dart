import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.svgPath,
    required this.description,
    this.svgColor,
    required this.backgroundColor,
    required this.onPressed,
  });

  final String? svgPath;
  final String description;
  final Color? svgColor;
  final Color backgroundColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          //Color(0xff1A1E24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          fixedSize: Size(
            context.sized.width * 0.9,
            context.sized.height * 0.07,
          )),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          svgPath != null
              ? SvgPicture.asset(
                  svgPath!,
                  height: context.sized.height * 0.03,
                  color: svgColor,
                )
              : Container(),
          Padding(padding: context.padding.low),
          Text(
            description,
            style: context.general.textTheme.titleSmall?.copyWith(
                color: const Color(0xffFFFFFF), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


/*

 color: const Color(0xff1A1E24),
ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: Size(
                    context.sized.width * 0.9,
                    context.sized.height * 0.07,
                  )),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   svgPath != null
              ? SvgPicture.asset(
                  svgPath!,
                  height: context.sized.height * 0.03,
                  color: color,
                )
              : Container(), 
                  Padding(padding: context.padding.low),
                  Text('Continue with Apple'),
                ],
              ),
            )

  */