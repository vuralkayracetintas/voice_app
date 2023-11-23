// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:kartal/kartal.dart';
// import 'package:voice_app/product/constants/color_constants.dart';
// import 'package:voice_app/product/widgets/buttons/custom_button.dart';
// import 'package:voice_app/product/widgets/textfields/custom_textfield_forget_password.dart';

// class ForgetPassword extends StatelessWidget {
//   const ForgetPassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final _controller = TextEditingController();
//     final TextEditingController emailController = TextEditingController();

//     Future<void> passwordReset(String email) async {
//       try {
//         // Firebase Authentication'da kullanıcının var olup olmadığını kontrol et
//         var methods =
//             await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

//         // Eğer kullanıcı varsa, şifre sıfırlama e-postasını gönder
//         if (methods.isNotEmpty) {
//           await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//           print('Şifre sıfırlama e-postası gönderildi');
//         } else {
//           print('Bu e-posta adresine kayıtlı bir kullanıcı bulunamadı');
//         }
//       } catch (e) {
//         print('Şifre sıfırlama hatası: $e');
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Forget Password',
//             // style: TextStyle(color: ColorConstants.colorsWhite),
//             style: context.general.textTheme.titleMedium?.copyWith(
//               color: ColorConstants.colorsWhite,
//               // fontSize: 20,
//             )),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: context.sized.dynamicHeight(0.04),
//             ),
//             Text(
//               'Reset Password 🔑',
//               style: context.general.textTheme.headlineSmall?.copyWith(
//                 color: ColorConstants.colorsWhite,
//               ),
//             ),
//             SizedBox(
//               height: context.sized.dynamicHeight(0.01),
//             ),
//             Text(
//               'Enter your email to Reset Password',
//               style: context.general.textTheme.titleSmall?.copyWith(
//                 color: ColorConstants.colorsWhite,
//               ),
//             ),
//             SizedBox(
//               height: context.sized.dynamicHeight(0.04),
//             ),
//             Padding(
//               padding: context.padding.low,
//               child: CustomTextFieldForgetPassword(
//                 controller: _controller,
//               ),
//             ),
//             SizedBox(
//               height: context.sized.dynamicHeight(0.02),
//             ),
//             TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: 'E-posta'),
//                 keyboardType: TextInputType.emailAddress,
//                 style: context.general.textTheme.titleMedium?.copyWith(
//                   color: ColorConstants.colorsWhite,
//                 )),
//             CustomButton(
//               description: 'Send Code',
//               backgroundColor: ColorConstants.colorBlue,
//               onPressed: () {
//                 String email = emailController.text;
//                 passwordReset(email);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  // Future<void> resetPassword(String email) async {
  //   try {
  //     final signInMethods =
  //         await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
  //     final userExists = signInMethods.isNotEmpty;
  //     final canSignInWithLink =
  //         signInMethods.contains(EmailAuthProvider.EMAIL_LINK_SIGN_IN_METHOD);
  //     final canSignInWithPassword = signInMethods
  //         .contains(EmailAuthProvider.EMAIL_PASSWORD_SIGN_IN_METHOD);
  //     print('sadasdasd');
  //   } on FirebaseAuthException catch (exception) {
  //     switch (exception.code) {
  //       case "invalid-email":
  //         print("Not a valid email address.");
  //         break;
  //       default:
  //         print("Unknown error.");
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şifremi Unuttum'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-posta'),
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                // resetPassword(email);
              },
              child: Text('Şifremi Sıfırla'),
            ),
          ],
        ),
      ),
    );
  }
}
