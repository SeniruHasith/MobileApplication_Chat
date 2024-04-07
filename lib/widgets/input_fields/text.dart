import 'package:flutter/material.dart';

import '../../values/colors.dart';
import '../../values/dimens.dart';


class CustomText extends StatelessWidget {
  final String text;
  final bool title;
  final bool bold;
  final bool big;
  final bool small;
  final bool center;
  final bool white;
  final bool dark;
  final bool accent;
  final bool primary;
  final bool primaryDark;
  final Color color;
  final int maxLines;

  CustomText(
      {this.text = '',
      this.title = false,
      this.bold = false,
      this.big = false,
      this.small = false,
      this.center= false,
      this.white = false,
      this.dark= false,
      this.accent = false,
      this.primary = false,
      this.primaryDark = false,
      this.color = AppColors.primaryColor,
      this.maxLines = 3});

  @override
  Widget build(BuildContext context) {
    final dynamic isBold = bold == true ? FontWeight.bold : FontWeight.normal;

    final String textValue = text;

    final double fontSize = title == true
        ? fontTextTitle
        : big == true
            ? fontTextBig
            : small == true
                ? fontTextSmall
                : fontText;

    final Color customColor = primaryDark == true
        ? AppColors.primaryColorDark
        : white == true
            ? Colors.white
            : accent == true
                ? AppColors.accentLightColor
                : AppColors.primaryColor;

    return Text(textValue,
        maxLines: maxLines,
        textAlign: center == true ? TextAlign.center : null,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: fontSize,
            color: color == null
                ? dark == true
                    ? AppColors.backgroundColor
                    : customColor
                : color,
            fontWeight: isBold));
  }
}
