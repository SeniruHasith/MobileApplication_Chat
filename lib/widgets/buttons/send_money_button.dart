import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// developed by seniru sep 2023

Widget SendMoneyBox(text, svgIcon, important, width, color, txtcolor, type) {
  return SizedBox(
    width: width,
    height: 120,
    child: Stack(
      children: [
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            width: width - 8,
            height: 102.5,
            decoration: BoxDecoration(
              color: color,
              boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF707070).withOpacity(0.30),
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: const Offset(2, 3),
                  ),
              ],
              borderRadius: kIsWeb
                  ? BorderRadius.circular(10)
                  : BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: (kIsWeb ? 10 : 0)),
                  SizedBox(
                      height: 40,
                      width: 50,
                      child: type == "SVG"
                          ? SvgPicture.asset(svgIcon)
                          : Image.asset(svgIcon)),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        //fontWeight: FontWeight.w600,
                        color: txtcolor),
                  ),
                ],
              ),
            ),
          ),
        ),
        !kIsWeb ?
        Positioned(
            right: 0,
            child: Stack(children: [
              Container(
                  height: 30,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 0.5, color: Colors.black.withOpacity(0.25)),
                      borderRadius: BorderRadius.circular(10))),
              Container(
                  height: 10,
                  width: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: const Icon(
                      Icons.chevron_right,
                      color: Color(0xff00508B),
                    ),
                  )),
            ])):Container()
      ],
    ),
  );
}
