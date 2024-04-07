import 'package:flutter/material.dart';

import 'app.constants.dart';
import 'colors.dart';

/// Project sl_login
/// Created by sahan on 11/1/21 13:03
class AppTextStyles {
  TextStyle appbarTitleTextStyle() {
    return TextStyle(
        color: AppColors.white,
        fontSize: AppConstants.adaptiveScreen.setSp(35),
        fontWeight: FontWeight.bold);
  }

  TextStyle appBarTextStyle() {
    return TextStyle(
      fontSize: 18,
      color: AppColors.white,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle text11PrimaryBold() {
    return TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text14BlackNormal() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text14RedkNormal() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.red,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text14PrimaryNormal() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.primaryColor,
      fontFamily: "Satoshi-Regular",
    );
  }

  TextStyle text14PrimaryBold() {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text16PrimaryBold() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
      fontFamily: "Satoshi-Regular",
    );
  }

  TextStyle text16PrimaryNormal() {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryColor,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text16BlackNormal() {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text18PrimaryBold() {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text18BlackBold() {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text14BlackBold() {
    return TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.black);
  }

  TextStyle text18BlackNormal() {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text21PrimaryBold() {
    return TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w800,
        color: AppColors.primaryColor,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text21BlackNormal() {
    return TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text21BlackBold() {
    return TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle textRed21normal() {
    return TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.normal,
        color: AppColors.red,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle text25PrimaryNormal() {
    return TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryColor);
  }

  TextStyle commonButtonTextStyle() {
    return TextStyle(
        color: AppColors.backgroundColor,
        fontWeight: FontWeight.bold,
        fontSize: AppConstants.adaptiveScreen.setSp(25),
        fontFamily: "Satoshi-Regular");
  }

  TextStyle titleText() {
    return TextStyle(
        color: AppColors.forgetPasswordTitleColor,
        fontSize: 35,
        fontWeight: FontWeight.w700,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle textWhite() {
    return TextStyle(
      color: AppColors.white,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textWhiteFont18() {
    return TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle subtitleText() {
    return TextStyle(
      color: Color(0xFFbce3f1),
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle numberStyle() {
    return TextStyle(
      color: Color(0xFFbce3f1),
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle transactionsDesc() {
    return TextStyle(
      color: AppColors.black,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle transactionsTime() {
    return TextStyle(
      color: Colors.black54,
      fontSize: 15,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle transactionAmount(String type) {
    return TextStyle(
      color: type == "CR" ? Colors.green : Colors.red,
      fontSize: 15,
      fontWeight: FontWeight.normal,
    );
  }

  //LanguageState locale = LanguageState(locale);

  TextStyle primaryTextStyle() {
    return TextStyle(
      color: AppColors.primaryColor,
      //fontSize: (LanguageSelected(Language.EN) == true) ? 20 : 10,
      //fontSize: (LanguageSelected(Language.EN).languageCode == 'en' ) ? 20 : 18,
      // (state.locale.languageCode == 'en') ? 25 : 16,
      //fontSize: (LanguageState.locale.languageCode == "en") ? 10 : 20,
      fontSize: 18,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.w800,
    );
  }

  TextStyle primaryTextStyleTamil() {
    return TextStyle(
      color: AppColors.appPrimaryColor,
      fontSize: 17,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle miniTextStyleAppPrimaryColor() {
    return TextStyle(
      color: AppColors.appPrimaryColor,
      fontSize: 14,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.bold,
      height: 1.5,
    );
  }

  TextStyle miniTextStyleAppGrayColor() {
    return TextStyle(
      color: AppColors.grey,
      fontSize: 16,
      fontFamily: 'Satoshi-Regular',
    );
  }

  TextStyle miniTextStyleClearCodeColor() {
    return TextStyle(
      color: Colors.blueAccent,
      fontSize: 16,
      fontFamily: 'Satoshi-Regular',
    );
  }

  TextStyle timerNumberTextStyle() {
    return TextStyle(
      color: AppColors.appPrimaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle largeWhiteText() {
    return TextStyle(
      color: AppColors.white,
      fontSize: 26,
      fontWeight: FontWeight.bold,
      fontFamily: 'Satoshi',
      letterSpacing: 1,
    );
  }

  TextStyle subTextLightBlueStyle() {
    return TextStyle(
      color: AppColors.lightBlueTextColor,
      fontSize: 16,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle miniTextStyleBlackColor() {
    return TextStyle(
      color: AppColors.black,
      fontSize: 14,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.normal,
      height: 1.5,
    );
  }

  TextStyle descriptionTextBlackFont12() {
    return TextStyle(
      color: AppColors.black,
      fontSize: 12,
      fontWeight: FontWeight.normal,
      fontFamily: 'Satoshi',
    );
  }

  TextStyle textStyleShineBlack() {
    return TextStyle(
      color: AppColors.textColorShineBlack,
      fontSize: 14,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle textStyleBlueFont16() {
    return TextStyle(
      color: AppColors.primaryTextColor,
      fontSize: 16,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle textStyleBlueFont14() {
    return TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: 14,
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.normal,
        height: 1.3);
  }

  TextStyle darkBlueBoldTextStyleFont16() {
    return TextStyle(
      fontSize: 16,
      color: AppColors.appPrimaryColor,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle dashboardBeginJourneyCardColorBoldTextStyleFont16() {
    return TextStyle(
      fontSize: 16,
      color: AppColors.dashboardBeginJourneyCardColor,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle miniTextStyle() {
    return TextStyle(
      color: AppColors.appPrimaryColor,
      fontSize: 14,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle descriptionTextStylePrimaryColorDark() {
    return TextStyle(
      fontSize: 15,
      color: AppColors.appPrimaryColor,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle miniTextDarkBlue() {
    return TextStyle(
      color: AppColors.miniTextDarkBlue,
      fontSize: 13,
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle accDetailsBlockText() {
    return TextStyle(
      color: AppColors.white.withOpacity(0.8),
      fontSize: 15,
      fontWeight: FontWeight.normal,
      fontFamily: 'Satoshi',
    );
  }

  TextStyle whiteTextFont15() {
    return TextStyle(
      color: AppColors.white,
      fontSize: 15,
      fontWeight: FontWeight.normal,
      fontFamily: 'Satoshi',
      letterSpacing: 1,
      wordSpacing: 1,
      height: 1.8,
    );
  }

  TextStyle white21Bold() {
    return TextStyle(
      color: AppColors.white,
      fontSize: 21,
      fontWeight: FontWeight.bold,
      fontFamily: 'Satoshi',
    );
  }

  TextStyle white13Normal() {
    return TextStyle(
      color: AppColors.white,
      fontSize: 13,
      fontWeight: FontWeight.normal,
      fontFamily: 'Satoshi',
    );
  }

  TextStyle viewTermsAndConditionsTextStyle() {
    return TextStyle(
      color: AppColors.primaryColor,
      fontSize: 15,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle textWhiteFont22() {
    return TextStyle(
      color: AppColors.white,
      fontSize: 22,
      fontWeight: FontWeight.w900,
    );
  }

  TextStyle balanceOnCardTextStyle() {
    return TextStyle(
      color: AppColors.white.withOpacity(0.8),
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle whiteTextFont22() {
    return TextStyle(
      color: AppColors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
      fontFamily: 'Satoshi',
    );
  }

  TextStyle imageUploadWidgetSubTitles() {
    return TextStyle(
      color: AppColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle boldSmallText() {
    return TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w800,
      fontSize: 13,
      letterSpacing: 0.22273,
    );
  }

  TextStyle boldBlackText() {
    return TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w800,
      fontSize: 18,
      fontFamily: 'Satoshi',
    );
  }

  TextStyle textStyleBlueFont13() {
    return TextStyle(
      color: AppColors.blueColorTermsNConditionInAddAcc,
      fontWeight: FontWeight.normal,
      fontSize: 13,
      fontFamily: 'Satoshi',
      letterSpacing: 0.22273,
    );
  }

  TextStyle miniTextStyleWhiteColorFont12() {
    return TextStyle(
        color: AppColors.white.withOpacity(0.8),
        fontSize: 12,
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.normal,
        height: 1.5);
  }

  TextStyle kycApprovedTextStyle() {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.lightGreen,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle kycApprovalPendingTextStyle() {
    return const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.lightOrange,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle kycRejectedTextStyle() {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.pinkRed,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle kycNotCompleteTextStyle() {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.grey,
        fontFamily: "Satoshi-Regular");
  }

  TextStyle forgotPasswordTextStyle() {
    return TextStyle(
      color: AppColors.primaryColor.withOpacity(0.9),
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: 'Satoshi',
    );
  }

  ///CENT_text styles starts-------
  ///

  TextStyle webNavBarTitle = const TextStyle(
    fontSize: 25,
    fontFamily: 'Satoshi-Medium',
    color: AppColors.black,
  );

  TextStyle webNavBarTrailing = const TextStyle(
    fontSize: 14,
    fontFamily: 'Satoshi-Bold',
    color: AppColors.white,
  );

  TextStyle titleOnBackground = const TextStyle(
      fontSize: 16,
      shadows: [Shadow(color: AppColors.grey)],
      color: AppColors.white,
      fontFamily: "Satoshi-Bold");

  TextStyle titleShadowTextStyle() {
    return const TextStyle(
        fontSize: 18,
        fontFamily: 'Satoshi-Bold',
        color: AppColors.white,
        shadows: <Shadow>[
          Shadow(
            blurRadius: 53.0,
            color: Color(0xFF055470),
          ),
          Shadow(
            blurRadius: 53.0,
            color: Color(0xFF055470),
          ),
          Shadow(
            blurRadius: 53.0,
            color: Color(0xFF055470),
          ),
        ]);
  }

  /// CENT_text styles ends -------
}

TextStyle titleText = TextStyle(
  color: AppColors.forgetPasswordTitleColor,
  fontSize: 35,
  fontWeight: FontWeight.w700,
  fontFamily: 'Satoshi',
);

TextStyle textWhite = TextStyle(
  color: AppColors.white,
  fontSize: 14,
  fontWeight: FontWeight.w600,
  fontFamily: 'Satoshi',
);

TextStyle subtitleText = TextStyle(
  color: AppColors.black,
  fontSize: 14,
  fontWeight: FontWeight.bold,
  fontFamily: 'Satoshi',
);

TextStyle welcome = TextStyle(
  color: AppColors.white,
  fontSize: 28,
  fontWeight: FontWeight.bold,
  fontFamily: 'Satoshi',
);
TextStyle welcomeSubtitle = TextStyle(
  color: AppColors.white,
  fontSize: 14,
  fontWeight: FontWeight.normal,
);
TextStyle underLineTextSignUp = TextStyle(
  color: AppColors.signUpnForgotTextColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
  fontFamily: 'Satoshi',
);
TextStyle languageSelectionTitleStyle = TextStyle(
  color: AppColors.primaryColor,
  fontSize: 15,
  fontWeight: FontWeight.bold,
  fontFamily: 'Satoshi',
);
TextStyle languageSelectionSubTitleStyle = TextStyle(
  color: AppColors.primaryColor,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  fontFamily: 'Satoshi',
);
TextStyle labelStyle = TextStyle(
  color: AppColors.textLabelColor,
  fontSize: 16,
  fontWeight: FontWeight.normal,
);
TextStyle textButton14Bold = TextStyle(
  color: AppColors.primaryColor.withOpacity(0.9),
  fontSize: 14,
  // fontWeight: FontWeight.bold,
  fontFamily: 'Satoshi-Bold',
);

TextStyle homeBeginFirstTitle = TextStyle(
  color: AppColors.white,
  fontSize: 16,
  fontWeight: FontWeight.normal,
  fontFamily: 'Satoshi',
);
TextStyle homeBeginJourneySecondTitle = TextStyle(
  color: AppColors.white,
  //fontSize: (LanguageSelected(Language.EN) == true) ? 25 : 20,
  fontWeight: FontWeight.bold,
  fontFamily: 'Satoshi',
);
TextStyle profileName = TextStyle(
  color: AppColors.primaryColor,
  fontSize: 17,
  fontWeight: FontWeight.bold,
  fontFamily: 'Satoshi',
);

TextStyle pagetitle = TextStyle(
  color: AppColors.black,
  fontSize: 25,
  fontWeight: FontWeight.bold,
  fontFamily: 'Satoshi',
);
TextStyle welcomeHome = TextStyle(
  color: AppColors.primaryColor,
  fontSize: 17,
  fontWeight: FontWeight.normal,
  fontFamily: 'Satoshi',
);
TextStyle balanceCheck = TextStyle(
  color: AppColors.black,
  fontSize: 14,
  fontWeight: FontWeight.bold,
  fontFamily: 'Satoshi',
);
TextStyle commonBold = TextStyle(
  color: AppColors.black,
  fontSize: 13,
  fontWeight: FontWeight.w700,
  fontFamily: 'Satoshi',
);
TextStyle commonBold2 = TextStyle(
  color: AppColors.black,
  fontSize: 13,
  fontWeight: FontWeight.bold,
  fontFamily: 'Satoshi',
);

///

TextStyle miniTextStyleBorderColorFont12 = TextStyle(
  color: AppColors.borderColor,
  fontSize: 12,
  fontFamily: 'Satoshi',
);

TextStyle miniTextStyleBlueFont13 = TextStyle(
  color: AppColors.black.withOpacity(0.3),
  fontSize: 13,
  fontWeight: FontWeight.bold,
  fontFamily: 'Satoshi',
);

TextStyle primaryTextStyle = TextStyle(
  color: AppColors.appPrimaryColor,
  fontSize: 20,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.w900,
);

TextStyle primaryTextStyleDiffSizes = TextStyle(
  color: AppColors.appPrimaryColor,
 // fontSize: (LanguageSelected(Language.EN) == true) ? 20 : 18,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.w900,
);

TextStyle miniTextStyle = TextStyle(
  color: AppColors.appPrimaryColor,
  fontSize: 14,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.normal,
);
TextStyle miniTextStyleAppPrimaryColor = TextStyle(
  color: AppColors.appPrimaryColor,
  fontSize: 14,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.bold,
  height: 1.5,
);

TextStyle miniTextStyleBlackColor = TextStyle(
  color: AppColors.black,
  fontSize: 14,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.normal,
  height: 1.5,
);

TextStyle miniTextStyleBlueColor = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontFamily: 'Satoshi',
    fontWeight: FontWeight.normal,
    height: 1.2);

TextStyle timerNumberTextStyle = TextStyle(
  color: AppColors.appPrimaryColor,
  fontSize: 42,
  fontWeight: FontWeight.bold,
);

TextStyle largeWhiteText = TextStyle(
  color: AppColors.white,
  fontSize: 30,
  fontWeight: FontWeight.bold,
  fontFamily: 'Satoshi',
  letterSpacing: 1,
);

TextStyle subTextLightBlueStyle = TextStyle(
  color: AppColors.lightBlueTextColor,
  fontSize: 18,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.normal,
);

TextStyle appBarTextStyle = TextStyle(
  fontSize: 18,
  color: AppColors.white,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.bold,
);

TextStyle darkBlueBoldTextStyleFont16 = TextStyle(
  fontSize: 16,
  color: AppColors.appPrimaryColor,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.bold,
);

TextStyle descriptionTextStylePrimaryColorDark = TextStyle(
  fontSize: 15,
  color: AppColors.appPrimaryColor,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.w600,
);

TextStyle miniTextDarkBlue = TextStyle(
  color: AppColors.miniTextDarkBlue,
  fontSize: 13,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.bold,
);
TextStyle accDetailsBlockText = TextStyle(
  color: AppColors.white.withOpacity(0.8),
  fontSize: 15,
  fontWeight: FontWeight.normal,
  fontFamily: 'Satoshi',
);

TextStyle descriptionTextBlackFont12 = TextStyle(
  color: AppColors.black,
  fontSize: 12,
  fontWeight: FontWeight.normal,
  fontFamily: 'Satoshi',
);

TextStyle textStyleShineBlack = TextStyle(
  color: AppColors.textColorShineBlack,
  fontSize: 14,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.normal,
);

TextStyle textStyleBlueFont16 = TextStyle(
  color: AppColors.primaryTextColor,
  fontSize: 16,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.normal,
);

TextStyle textStyleBlueFont13 = TextStyle(
  color: AppColors.lightBlueTextColor,
  fontSize: 13,
  fontFamily: 'Satoshi',
  fontWeight: FontWeight.normal,
);
