import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
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
        title: Text(
          'Sign In',
          style: context.general.textTheme.bodyLarge
              ?.copyWith(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            const AppIconWidget(),
            Text(
              'Welcome Voice AI 👋🏻',
              style: context.general.textTheme.titleLarge?.copyWith(
                color: const Color(0xffFFFFFF),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Enter your Email & Password to Sign In',
              style: context.general.textTheme.titleSmall?.copyWith(
                color: const Color(0xffFFFFFF),
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            SizedBox(
              width: context.sized.width * 0.9,
              child: TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  prefixIcon: Padding(
                    padding: context.padding.horizontalMedium,
                    child: SvgPicture.asset(
                      'assets/svg/mail.svg',
                      height: context.sized.height * 0.03,
                      // color: color,
                    ),
                  ),
                  labelText: 'Email',
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
                      'assets/svg/password.svg',
                      height: context.sized.height * 0.03,
                      // color: color,
                    ),
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  labelText: 'Password',
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
                  'Remember me',
                  style: context.general.textTheme.titleSmall?.copyWith(
                    color: const Color(0xffFFFFFF),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password ?',
                    style: context.general.textTheme.titleSmall?.copyWith(
                      color: const Color(0xff235dff),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              description: 'Sign In',
              backgroundColor: Color(0xff235dff),
              onPressed: () {},
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 2, // Çizgi yüksekliğini ayarlayabilirsiniz
                  width: context.sized.width *
                      0.4, // Çizgi uzunluğunu ayarlayabilirsiniz
                  color: Colors.white, // Çizgi rengini özelleştirebilirsiniz
                  margin: const EdgeInsets.symmetric(
                      horizontal:
                          10), // Çizgi ile metinler arasındaki boşluğu ayarlayabilirsiniz
                ),
                const Text(
                  'OR',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  height: 2,
                  width: context.sized.width * 0.4, // Çizgi uzunlu
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomSocialButton(
                  backgroundColor: Color(0xff1A1E24),
                  onPressed: () {},
                  svgPath: 'assets/svg/google.svg',
                ),
                CustomSocialButton(
                  backgroundColor: Color(0xff1A1E24),
                  onPressed: () {},
                  svgPath: 'assets/svg/apple.svg',
                ),
              ],
            ),
            Spacer(),
            SignUpTextWidget(),
            Spacer()
          ],
        ),
      ),
    );
  }
}
