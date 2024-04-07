import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget welcomeGlassBox(text, svgIcon, important, width) {
  return SizedBox(
    width: width,
    height: 110.0,
    child: Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            width: width,
            height: 110.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: SvgPicture.asset(svgIcon, fit: BoxFit.contain),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: important
                    ? Colors.white.withOpacity(0.8)
                    : Colors.white.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              width: width,
              height: 5,
            ))
      ],
    ),
  );
}