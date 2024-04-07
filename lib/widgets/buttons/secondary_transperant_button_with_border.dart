import 'package:flutter/material.dart';

import '../../values/colors.dart';

class SecondaryTransperantButtonWithBorder extends StatelessWidget {
  final String buttonText;
  final double buttonWidthRatio;
  final bool enabled;
  final Function? onPressed;
  final double roundedRectangleRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? textFontSize;

  SecondaryTransperantButtonWithBorder({
    required this.buttonText,
    this.enabled = true,
    required this.onPressed,
    this.buttonWidthRatio = 0.9,
    this.roundedRectangleRadius = 13,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    this.textFontSize = 19,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 0,
          horizontal: horizontalPadding ?? 0,
        ),
        child: SizedBox(
          width: buttonWidthRatio,
          height: MediaQuery.of(context).size.height * .07,
          child: OutlinedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(1),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(roundedRectangleRadius),
                ),
              ),
              overlayColor: MaterialStateProperty.all(Colors.black),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.white;
                  }
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.disabledSecondaryButtonColorTheme;
                  }
                  return Colors.white;
                },
              ),
              side: MaterialStateProperty.resolveWith<BorderSide?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const BorderSide(
                      width: 1,
                      color: Colors.white
                    );
                  }
                  if (states.contains(MaterialState.disabled)) {
                    return const BorderSide(
                      width: 1,
                      color: Colors.white
                    );
                  }
                  return const BorderSide(
                    width: 1,
                    color: Colors.white
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
