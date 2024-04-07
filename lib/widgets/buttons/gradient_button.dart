import 'package:flutter/material.dart';
import '../../values/colors.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.buttonRadius,
    this.buttonColor,
    this.gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.lightGradient,
        AppColors.darkGradient,
        AppColors.darkestGradient,
      ],
    ),
    this.width = double.infinity,
    this.height = 48,
    this.textAlign,
    this.buttonTextSize = 16,
    this.padding,
  }) : super(key: key);

  final void Function()? onPressed;
  final String buttonText;
  final double? buttonRadius;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final TextAlign? textAlign;
  final double? buttonTextSize;
  final EdgeInsetsGeometry? padding;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(buttonRadius ?? 0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          textAlign: textAlign,
          style: TextStyle(
            color: buttonColor,
            fontSize: buttonTextSize,
          ),
        ),
      ),
    );
  }
}
