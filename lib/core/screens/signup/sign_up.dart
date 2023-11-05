import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';
import 'package:voice_app/product/constants/color_%20constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';
import 'package:voice_app/product/widgets/custom_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = false;
  bool _passwordAgainVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            NavigationService.instance.navigateToBack();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorConstants.colorsWhite,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            // mail textfield
            SizedBox(
              width: context.sized.width * 0.9,
              child: TextFormField(
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
                ),
              ),
            ),
            SizedBox(
              height: context.sized.height * 0.022,
              // height: 21,
            ),
            //password textfiled
            SizedBox(
              width: context.sized.width * 0.9,
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                style: context.general.textTheme.titleMedium?.copyWith(
                  color: ColorConstants.colorsWhite,
                ),
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
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
              ),
            ),
            SizedBox(
              height: context.sized.height * 0.022,
              // height: 21,
            ),
            // password again textfield
            SizedBox(
              width: context.sized.width * 0.9,
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                style: context.general.textTheme.titleMedium?.copyWith(
                  color: ColorConstants.colorsWhite,
                ),
                obscureText: !_passwordAgainVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordAgainVisible = !_passwordAgainVisible;
                      });
                    },
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordAgainVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
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
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  labelText: StringConstants.passwordAgain,
                ),
              ),
            ),
            SizedBox(
              height: context.sized.height * 0.022,
              // height: 21,
            ),
            CustomButton(
              description: 'Sign Up',
              backgroundColor: ColorConstants.colorBlue,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
