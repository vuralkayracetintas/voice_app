import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';
import 'package:voice_app/product/constants/color_%20constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';
import 'package:voice_app/product/widgets/app_icon_widget.dart';
import 'package:voice_app/product/widgets/custom_button.dart';
import 'package:voice_app/product/widgets/custom_social_button.dart';
import 'package:voice_app/product/widgets/signup_text_widget.dart';

class SignInMail extends StatefulWidget {
  const SignInMail({super.key});

  @override
  State<SignInMail> createState() => _SignInMailState();
}

class _SignInMailState extends State<SignInMail> {
  bool isChecked = false;
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
        title: Text(
          StringConstants.signIn,
          style: context.general.textTheme.bodyLarge
              ?.copyWith(color: ColorConstants.colorsWhite),
        ),
        backgroundColor: ColorConstants.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const AppIconWidget(),
            Text(
              StringConstants.welcomeApp,
              style: context.general.textTheme.titleLarge?.copyWith(
                color: ColorConstants.colorsWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              StringConstants.enterMailDesc,
              style: context.general.textTheme.titleSmall?.copyWith(
                color: ColorConstants.colorsWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: context.sized.width * 0.9,
              child: TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
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
            SizedBox(
              width: context.sized.width * 0.9,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.visibility),
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
                  labelText: StringConstants.password,
                ),
              ),
            ),
            Row(
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
            ),
            const Spacer(),
            CustomButton(
              description: StringConstants.signIn,
              backgroundColor: ColorConstants.colorBlue,
              onPressed: () {},
            ),
            const Spacer(),
            Row(
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
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomSocialButton(
                  backgroundColor: ColorConstants.darkBtnColor,
                  onPressed: () {},
                  svgPath: StringConstants.googleSVG,
                ),
                CustomSocialButton(
                  backgroundColor: ColorConstants.darkBtnColor,
                  onPressed: () {},
                  svgPath: StringConstants.appleSVG,
                ),
              ],
            ),
            const Spacer(),
            const SignUpTextWidget(),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
