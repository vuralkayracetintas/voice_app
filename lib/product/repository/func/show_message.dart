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
        context: context,
        builder: (BuildContext context) {
          return CustomAlertCard(
            image: const Image(
              image: AssetImage(StringConstants.loginSuccess),
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

  // mail verified
  void showMailNotVerified(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomAlertCard(
            image: const Image(
              image: AssetImage(StringConstants.user_img),
            ),
            title: Text(
              'mail onay',
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
              // NavigationService.instance.navigateToPageRemoveAll(path: '/home');
            },
            buttonText: Text(
              // StringConstants.continueHome,
              'mail onaylaaaaa',
              style: context.general.textTheme.titleMedium?.copyWith(
                color: ColorConstants.colorsWhite,
              ),
            ),
          );
        });
  }
}
