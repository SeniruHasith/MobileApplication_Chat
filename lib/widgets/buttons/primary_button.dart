import 'package:flutter/material.dart';
import '../../values/colors.dart';

///developed by: Rhylvin March 2023
class PrimaryButton extends StatelessWidget {
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

  const PrimaryButton({
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding ?? 0,
        horizontal: horizontalPadding ?? 0,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * buttonWidthRatio,
        height: MediaQuery.of(context).size.height * (buttonHeightRatio ?? .07),
        child: Container(
          decoration: lightButton
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(roundedRectangleRadius),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                )
              : BoxDecoration(
                  boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      )
                    ],
                  borderRadius: BorderRadius.circular(roundedRectangleRadius),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xFF0040A6),
                        Color(0xFF1573B2),
                        Color(0xFF1E96C1),
                      ]
                  )),
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
                          return Colors.blue;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          return AppColors.disabledPrimaryButtonColorTheme;
                        }
                        return AppColors.titleTextColor;
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
                          return AppColors.mainColorTheme;
                        }
                        if (states.contains(MaterialState.disabled)) {
                          return AppColors.mainColorTheme;
                        }
                        return AppColors.mainColorTheme;
                      },
                    )
                  : null,
            ),
            onPressed: enabled
                ? () {
                    onPressed!();
                  }
                : null,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: leading == null ? 0 : 40),
                  child: Row(
                    mainAxisAlignment: centerText
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          buttonText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                removeArrowWidget
                    ? Container()
                    : Container(
                        alignment: Alignment.centerRight,
                        child: lightButton
                            ? Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      roundedRectangleRadius),
                                  color: Colors.white,
                                ),
                                child: Icon(arrowForwardDirection
                                    ? Icons.arrow_forward
                                    : Icons.arrow_back),
                              )
                            : Icon(arrowForwardDirection
                                ? Icons.arrow_forward
                                : Icons.arrow_back),
                      ),
                leading != null
                    ? Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      roundedRectangleRadius),
                                  color: Colors.white,
                                ),
                                child: leading!),
                            const SizedBox(width: 10)
                          ],
                        ),
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
