import 'package:flutter/material.dart';

import '../../values/colors.dart';

class corousel_button extends StatelessWidget {
  final String buttonText;
  final double buttonWidthRatio;
  final bool enabled;
  final Function? onPressed;
  final bool removeArrowWidget;
  final double roundedRectangleRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? textFontSize;
  final Widget? leading;
  final bool lightButton;
  final double? buttonHeightRatio;
  final bool centerText;
  final bool arrowForwardDirection;

  corousel_button({
    required this.buttonText,
    this.enabled = true,
    this.buttonWidthRatio = 0.5,
    this.onPressed,
    this.removeArrowWidget = false,
    this.roundedRectangleRadius = 12,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    this.textFontSize = 19,
    this.leading,
    this.lightButton = false,
    this.buttonHeightRatio = .07,
    this.centerText = true,
    this.arrowForwardDirection = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 0,
        horizontal: horizontalPadding ?? 0,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * buttonWidthRatio,
        height: MediaQuery.of(context).size.height * (buttonHeightRatio ?? .07),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(roundedRectangleRadius),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0040A6),
                    Color(0xFF0040A6),
                    Color(0xFF0D5094),
                    Color(0xFF053B72)
                  ])),
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(roundedRectangleRadius),
                ),
              ),
              backgroundColor: lightButton
                  ? MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.transparent;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          return AppColors.disabledPrimaryButtonColorTheme;
                        }
                        return Colors.transparent;
                      },
                    )
                  : MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.transparent;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          return AppColors.disabledPrimaryButtonColorTheme;
                        }
                        return Colors.transparent;
                      },
                    ),
              textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return TextStyle(
                      fontSize: textFontSize,
                      fontFamily: 'Satoshi-Regular',
                    );
                  }
                  if (states.contains(MaterialState.disabled)) {
                    return TextStyle(
                      fontSize: textFontSize,
                      fontFamily: 'Satoshi-Regular',
                    );
                  }
                  return TextStyle(
                    fontSize: textFontSize,
                    fontFamily: 'Satoshi-Regular',
                  );
                },
              ),
              foregroundColor: lightButton
                  ? MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.transparent;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.transparent;
                        }
                        return Colors.transparent;
                      },
                    )
                  : null,
            ),

            // onPressed: onPressed,
            onPressed: enabled
                ? () {
                    onPressed!();
                  }
                : null,
            // child: fullWidth
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: leading == null ? 0 : 30),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: centerText
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            buttonText,

                            //textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                removeArrowWidget
                    ? Container()
                    : Container(
                        alignment: Alignment.centerRight,
                        child: Icon(arrowForwardDirection
                            ? Icons.chevron_right
                            : Icons.chevron_left),
                      ),
                leading != null
                    ? Container(
                        alignment: Alignment.centerLeft,
                        child: leading!,
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
