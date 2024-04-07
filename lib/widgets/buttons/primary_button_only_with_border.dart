import 'package:flutter/material.dart';
import '../../values/colors.dart';



class PrimaryButtonOnlyWithBorder extends StatelessWidget {
  final String buttonText;
  final double buttonWidthRatio;
  final bool enabled;
  final Function? onPressed;
  final double roundedRectangleRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? textFontSize;
  final bool whiteButton;

  PrimaryButtonOnlyWithBorder({
    required this.buttonText,
    this.enabled = true,
    required this.onPressed,
    this.buttonWidthRatio = 0.9,
    this.roundedRectangleRadius = 12,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    this.textFontSize = 19,
    this.whiteButton=false
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 0,
          horizontal: horizontalPadding ?? 0,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * buttonWidthRatio,
          height: MediaQuery.of(context).size.height * .07,
          child: OutlinedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(roundedRectangleRadius),
                ),
              ),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return whiteButton?AppColors.white: AppColors.enabledPrimaryButtonTextColorTheme;
                  }
                  if (states.contains(MaterialState.disabled)) {
                    return whiteButton?AppColors.white:AppColors.disabledSecondaryButtonColorTheme;
                  }
                  return whiteButton?AppColors.white:AppColors.enabledSecondaryButtonColorTheme;
                },
              ),
              side: MaterialStateProperty.resolveWith<BorderSide?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return  BorderSide(
                      width: 1.5,
                      color: whiteButton?AppColors.white:AppColors.enabledPrimaryButtonTextColorTheme,
                    );
                  }
                  if (states.contains(MaterialState.disabled)) {
                    return  BorderSide(
                      width: 1.5,
                      color: whiteButton?AppColors.white:AppColors.disabledSecondaryButtonColorTheme,
                    );
                  }
                  return  BorderSide(
                    width: 1.5,
                    color: whiteButton?AppColors.white:AppColors.enabledSecondaryButtonColorTheme,
                  );
                },
              ),
              textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(
                  fontSize: textFontSize,
                  fontFamily: 'Satoshi-Regular',
                ),
              ),
            ),
            onPressed: enabled
                ? () {
                    onPressed!();
                  }
                : null,
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
}
