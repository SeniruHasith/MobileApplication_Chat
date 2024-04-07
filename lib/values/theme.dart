import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final ThemeData theme = ThemeData(
  primaryColor: colors.AppColors.primaryColor,
  scaffoldBackgroundColor: colors.AppColors.backgroundColor,

  appBarTheme: AppBarTheme(
    color: colors.AppColors.backgroundColor,
    iconTheme: IconThemeData(color: colors.AppColors.accentLightColor)
  ),

  buttonTheme: ButtonThemeData(
    buttonColor: colors.AppColors.accentLightColor,
    disabledColor: colors.AppColors.primaryColorDark
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: colors.AppColors.accentColor)
);
