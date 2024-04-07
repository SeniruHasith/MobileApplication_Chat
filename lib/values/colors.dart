import 'package:flutter/material.dart';

class AppColors {
  //Dashboard menu colors
  static const String shadowMenuColor = "0xFF31A0D9";
  static const String topUpColor = "0xFF31D9AB";
  static const String cardsAccountsColor = "0xFF31A0D9";
  static const String sendMoneyColor = "0x553137D9";
  static const String reqMoneyColor = "0xFFEBEB6C";
  static const String payBillsColor = "0xFFEBAB6C";
  static const String socialShareColor = "0x553137D9";
  static const Color reviewColor = Color(0xFFF3F3F3);
  static const Color accentColor = Color(0xFF202025);
  static const Color successColor = Color(0xFF249733);
  static const Color accentLightColor = Colors.white;

  static const Color pinPadButtonColor = Color(0xFF105CAA);
  static const Color pinPadButtonPressedColor = Color(0x94105CAA);

  static const Color titleTextColor = Color(0xFFF4FCFC);
  static const Color payeeButtonColor = Color(0xFFD6F1F8);
  static const Color primaryColorDark = Colors.white;
  static Color transparent = Colors.white.withOpacity(0);

  static const Color facebookColor = Color(0xFFf4d6cac);
  static const Color backgroundDarkColor = Color(0xFF3a3b35);
  static const Color cardColor = Color(0xFF2b2d34);

  static const Color backgroundGradient1 = Color(0xFF202025);
  static const Color backgroundGradient2 = Color(0xFF393838);
  static const Color backgroundGradient3 = Color(0xFF202025);

  static const LinearGradient gradientButtonColor = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Color(0xFF0040A6),
        Color(0xFF1573B2),
        Color(0xFF1E96C1),
      ]);

  static const Color disabledTextColor = Color(0xFFa1a1a1);
  static const Color disabledColor = Colors.black38;
  static const Color disabledListViewColor = Color(0xFFf7f7f7);

  static const Color canvasColor = Colors.transparent;

  static const Color snackbarBackgroundColor = Colors.black87;
  static const Color toastBackgroundColor = Colors.black87;
  static const Color toastTextColor = Colors.white;
  static const Color white = Colors.white;
  static const Color forgetPasswordTitleColor = const Color(0xFFbbeaf2);
  static const Color buttonColor = const Color(0xFF0076b7);
  static const Color backgroundColor = const Color(0xFF13508a);
  static const Color primaryColor = const Color(0xFF0076b7);
  static const Color primaryColorTwo = const Color(0xFF0F5BA9);
  static const Color dashboardBeginJourneyCardColor = const Color(0xFF3F72C5);
  static const Color tabSelectedColor = const Color(0xFFE0F3FF);
  static const Color textLabelColor = const Color(0xff99a6b8);
  static const Color underlineColor = const Color(0xFF6584a1);
  static const Color subtitleTextColor = const Color(0xFFbce3f1);
  static const Color buttonGradientColorFirst = const Color(0xFF007BA5);
  static const Color buttonGradientColorSecond = const Color(0xFF007DA7);
  static const Color secondaryBackgroundColor = const Color(0xFF707070);
  static const Color grey = const Color(0xFF9D9898);
  static const Color buttonShadowColor = const Color(0xFF02689E);
  static const Color signUpnForgotTextColor = const Color(0xFF658CBD);
  static const Color shadowColor = const Color(0xFF6DBFEC);
  static const Color fillColors = const Color(0xFFE9F2FF);
  static const Color backBlue = const Color(0xFF255CA2);
  static const Color black = Colors.black87;
  static const Color shadowColor3 = const Color(0xFFF7F7F7);

  static const Color gradiant1 = const Color(0xFF007BA5);
  static const Color gradiant2 = const Color(0xFF89CAE1);

  /// gradient color of locate us card view bar
  static const Color locateUsGradiant1 = const Color(0xFFD48EF2);
  static const Color locateUsGradiant2 = const Color(0xFF007BA5);

  ///Remake design colors
  static const Color appPrimaryColor = const Color(0xFF105CAA);
  static const Color centePrimaryColor = const Color(0xFF0040A6);
  static const Color appPrimaryColorLight = const Color(0x3B105CAA);
  static const Color borderColor = const Color(0xFFB1B1B1);
  static const Color darkBorderColor = const Color(0xFF6B6B6B);
  static const Color primaryTextColor = const Color(0xFF245BA1);
  static const Color blueBackgroundColor2 = const Color(0xFF245AA0);
  static const Color lightBlueTextColor = const Color(0xFF92B6E3);
  static const Color barIndicatorSelectedColor = const Color(0xFF3E8FC4);
  static const Color expandingBarIndicatorSelectedColor =
      const Color(0xFF3F72C5);
  static const Color cardBackgroundColor = const Color(0xFF2D63BB);
  static const Color lightGreen = const Color(0xff77E494);
  static const Color lightOrange = const Color(0xffEC8E00);
  static const Color backgroundColorGrey = const Color(0xFF707070);
  static const Color cardViewBackgroundColorDarkBlue = const Color(0xFF223C65);
  static const Color cardViewBackgroundColorBlue = const Color(0xFF007BA5);
  static const Color cardViewTextColor = const Color(0xFF223C65);
  static const Color miniTextDarkBlue = const Color(0xFF182D55);
  static const Color textColorShineBlack = const Color(0xFF141414);
  static const Color lightBlueContainerBackgroundColor =
      const Color(0xFFE9F2FF);
  static const Color loadingBackGroundColor = const Color(0xFFf0f0f0);
  static const Color pinkRed = const Color(0xFFCE6363);
  static const Color red = const Color(0xFFC51E1E);
  static const Color green = const Color(0xFF17A576);
  static const Color lightBlueBorderColor = const Color(0xFF90E0EF);
  static const Color blueColorTermsNConditionInAddAcc = const Color(0xFF245BA1);
  static Color primaryColorLight = Color(0xFFF6FEFD);
  static const List<int> colorPallets = [
    0xFF00D86C,
    0xFFC4D800,
    0xFF7B00D8,
    0xFFBF54A3,
    0xFFD55147,
    0xFFD86C00,
    0xFF03C5CC,
    0xFF98D800,
    0xFF00D896,
    0xFF0095D8
  ];

//main color theme of the app
  static const mainColorTheme = Color(0xFF0040A6);

//enabled Primary Button Color Themes
  static const enabledPrimaryButtonColorTheme = mainColorTheme;
  static const enabledPrimaryButtonTextColorTheme = Colors.white;

//disabled Primary Button Color Themes
  static const disabledPrimaryButtonColorTheme = Color(0xFFEBEBEB);
  static const disabledPrimaryButtonTextColorTheme = Color(0xFF929292);

//enabled Secondary Button Color Themes
  static const enabledSecondaryButtonColorTheme = mainColorTheme;
  static const enabledSecondaryButtonTextColorTheme = Colors.white;

//disabled Secondary Button Color Themes
  static const disabledSecondaryButtonColorTheme = Color(0xFF929292);

//popup Alert Dialog Text Color Theme
  static const alertDialogTextColorTheme = Color(0xFF066B8D);
  static const transactionHistoryColor = Color(0xFFEAEAEA);
  static const activeColor = Color(0xFF38BD57);
  static const deviceBackground = Color(0xFFF6FEFD);

  static const recentTransactionHistoryItemColor = Color(0xFFF9FEFE);
  static const scanQrColors = Color(0x00f6fefd);

  static const pendingTextColor = Color(0xFFAA8110);
  static const deleteColor = Color(0xFFA60000);

  // Font Colors
  static const blueFontColor = Color(0xFF0B50A2);
  static const darkBlueFontColor = Color(0xFF043770);
  static const greyFontColor = Color(0xFF575757);

  // Gradient Colors - Button
  static const lightGradient = Color(0xFF1E96C1);
  static const darkGradient = Color(0xFF1573B2);
  static const darkestGradient = Color(0xFF0040A6);

  // Gradient Colors - List Tile
  static const lightGrey = Color(0xFFCFCFCF);
  static const whiteWhite = Color(0xFFFFFFFF);

  // Revamp Shimmer Color
  static const shimmerColor = Color(0xFFE2E1EB);
  static const shimmerBackgroundColor = Color(0xFFF8F8FA);

  // Background Colors
  static const lightGreyBackgroundColor = Color(0xFFF3F3F3);

  // Checkbox Colors
  static const checkBoxColor = Color(0xFF0F5AA6);

  // Reminder Text font color
  static const reminderTextColor = Color(0xFF404040);
  static const cardBorderColor = Color(0xFFAEAEAE);
  static const selectedColor = Color(0xFF00508B);

  // Prepaid Card Colors
  static const prepaidCardColor = Color(0xFFF5F5F5);
  static const prepaidHeadingFontColor = Color(0xFF2C677C);
  static const prepaidTextFontColor = Color(0xFF004861);

  // Notification Colors
  static const Color pendingColor = Color(0xFFF6CB8A);
  static const Color rejectedColor = Color(0xFFE97B7B);
  static const disabledBorderColor = Color(0xFFAEAEAE);
  static const userNameColor = Color(0xFF707070);
}
