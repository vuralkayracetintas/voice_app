import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';
import 'package:voice_app/product/constants/color_constants.dart';
import 'package:voice_app/product/constants/string_constants.dart';
import 'package:voice_app/product/widgets/general/custom_alert_card.dart';

class ShowMessage {
  // error login snackbar
  void showSnackbar(BuildContext context, String message) {
    const snackBar = SnackBar(
      content: Text('Kullanici verisi bulunamadi '),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    print(message);
  }

// success login dialog
  void showLoginSuccess(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CustomAlertCard(
            image: const Image(
              image: AssetImage(StringConstants.success),
            ),
            title: Text(
              StringConstants.signInSuccess,
              style: context.general.textTheme.titleLarge?.copyWith(
                  color: ColorConstants.colorsWhite,
                  fontWeight: FontWeight.bold),
            ),
            desc: Text(
              StringConstants.successDesc,
              style: context.general.textTheme.titleSmall?.copyWith(
                color: ColorConstants.colorsWhite,
              ),
            ),
            onPressed: () {
              NavigationService.instance.navigateToPageRemoveAll(path: '/home');
            },
            buttonText: Text(
              StringConstants.continueHome,
              style: context.general.textTheme.titleMedium?.copyWith(
                color: ColorConstants.colorsWhite,
              ),
            ),
          );
        });
  }

  // void showLoginFailed(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return CustomAlertCard(
  //             image: image,
  //             title: title,
  //             desc: desc,
  //             onPressed: onPressed,
  //             buttonText: buttonText);
  //       });
  // }

  // mail verified
  void showMailNotVerified(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CustomAlertCard(
            image: const Image(
              image: AssetImage(StringConstants.mail),
            ),
            title: Text(
              'Lutfen mail adresinizi onaylayiniz',
              textAlign: TextAlign.center,
              style: context.general.textTheme.titleLarge?.copyWith(
                  color: ColorConstants.colorsWhite,
                  fontWeight: FontWeight.bold),
            ),
            desc: Text(
              // StringConstants.successDesc,
              'Kayit islemi gerceklestikten sonra mail adresinize gelen onay mailini onaylayiniz',
              textAlign: TextAlign.center,
              style: context.general.textTheme.titleSmall?.copyWith(
                color: ColorConstants.colorsWhite,
              ),
            ),
            onPressed: () {
              // NavigationService.instance.navigateToPageRemoveAll(path: '/home');
              NavigationService.instance.navigateToBack();
            },
            buttonText: Text(
              // StringConstants.continueHome,
              'Tamam',
              style: context.general.textTheme.titleMedium?.copyWith(
                color: ColorConstants.colorsWhite,
              ),
            ),
          );
        });
  }

  void showSuccessRegister(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CustomAlertCard(
              image: Image(
                image: AssetImage(StringConstants.success),
              ),
              title: Text(
                'Kayit Basarili',
                style: context.general.textTheme.titleLarge?.copyWith(
                    color: ColorConstants.colorsWhite,
                    fontWeight: FontWeight.bold),
              ),
              desc: Text(
                'Kayit isleminiz basariyla gerceklesti, luften mail adresinize gelen maili onaylayiniz',
                textAlign: TextAlign.center,
                style: context.general.textTheme.titleSmall?.copyWith(
                  color: ColorConstants.colorsWhite,
                ),
              ),
              onPressed: () {
                NavigationService.instance
                    .navigateToPageRemoveAll(path: '/sign_in_mail');
              },
              buttonText: Text(
                'Giris Ekranina Don',
                style: context.general.textTheme.titleMedium?.copyWith(
                  color: ColorConstants.colorsWhite,
                ),
              ));
        });
  }
}
