import 'package:flutter/material.dart';


import '../../values/colors.dart';

///developed by: Rhylvin May 2023
class WhiteButton extends StatelessWidget {
  final String buttonText;
  final double buttonWidthRatio;
  final bool enabled;
  final Function? onPressed;
  final double roundedRectangleRadius;
  final double verticalPadding;
  final double horizontalPadding;
  final double textFontSize;
  final double? buttonHeightRatio;

  WhiteButton({
    required this.buttonText,
    this.enabled = true,
    this.buttonWidthRatio = 0.7,
    this.onPressed,
    this.roundedRectangleRadius = 13,
    this.verticalPadding = 5,
    this.horizontalPadding = 0,
    this.textFontSize = 19,
    this.buttonHeightRatio = .07,
  });

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
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(1),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(roundedRectangleRadius),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return AppColors.white;
                }
                if (states.contains(MaterialState.disabled)) {
                  return AppColors.white;
                }
                return AppColors.white;
              },
            ),
            textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return TextStyle(
                    fontSize: textFontSize,
                    fontFamily: 'Satoshi-Bold',
                  );
                }
                if (states.contains(MaterialState.disabled)) {
                  return TextStyle(
                    fontSize: textFontSize,
                    fontFamily: 'Satoshi-Bold',
                  );
                }
                return TextStyle(
                  fontSize: textFontSize,
                  fontFamily: 'Satoshi-Bold',
                );
              },
            ),
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return AppColors.black;
                }
                if (states.contains(MaterialState.disabled)) {
                  return AppColors.black;
                }
                return AppColors.black;
              },
            ),
          ),
          onPressed: enabled
              ? () {
                  onPressed!();
                }
              : null,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
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
              Container(
                alignment: Alignment.centerRight,
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
