import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SignUpTextWidget extends StatelessWidget {
  const SignUpTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an Account ?',
            style: context.general.textTheme.titleSmall?.copyWith(
                color: const Color(0xffFFFFFF), fontWeight: FontWeight.bold)),
        TextButton(
            onPressed: () {},
            child: Text(
              'Sign Up',
              style: context.general.textTheme.titleSmall?.copyWith(
                  color: const Color(0xff235dff), fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
