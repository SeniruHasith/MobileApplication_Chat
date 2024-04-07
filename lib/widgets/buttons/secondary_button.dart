import 'dart:ui';
import 'package:flutter/material.dart';

import '../../values/colors.dart';

class SecondaryButton extends StatefulWidget {
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final double height;
  final double width;
  final Function() onTap;
  final double fontSize;
  final FontWeight weight;
  final Color borderColor;

  SecondaryButton({
    required this.buttonText,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.onTap,
    required this.height,
    required this.width,
    this.fontSize = 15.0,
    this.weight = FontWeight.normal,
    this.borderColor = AppColors.darkBorderColor
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.only(left: 2,right: 2),
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color:widget.borderColor),
          color: widget.buttonColor,
        ),
        child: Text(
          widget.buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: widget.buttonTextColor,
            fontSize: widget.fontSize,
            fontWeight: widget.weight
          ),
        ),
      ),
    );
  }
}
