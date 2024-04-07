import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../values/colors.dart';
import '../../values/images.dart';
import '../buttons/primary_button.dart';

class EmptyResponse extends StatefulWidget {
  final String text;
  final String? subtext;
  final String buttonText;
  final String navigationRoute;
  final bool isButtonVisible;
  final String imageType;
  final String imageString;

  const EmptyResponse({
    Key? key,
    this.imageType = "PNG",
    this.imageString = AppImages.centeEmptyList,
    this.subtext,
    required this.text,
    required this.buttonText,
    required this.navigationRoute,
    required this.isButtonVisible,
  }) : super(key: key);

  @override
  State<EmptyResponse> createState() => _EmptyResponseState();
}

class _EmptyResponseState extends State<EmptyResponse> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///image
        SizedBox(
          width: MediaQuery.of(context).size.width * (0.5),
          child: Center(
            child: SizedBox(
                width: 250,
                height: 250,
                child: widget.imageType == "SVG"
                    ? SvgPicture.asset(widget.imageString)
                    : Image.asset(widget.imageString)),
          ),
        ),

        ///space
        SizedBox(
          height: 10,
        ),

        ///text
        Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppColors.appPrimaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                if (widget.subtext != null) ...[
                  Text(
                    widget.subtext ?? "",
                    style: const TextStyle(
                        color: AppColors.appPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ]
              ],
            ),
          ),
        ),

        ///navigation button
        widget.isButtonVisible
            ? PrimaryButton(
                buttonText: widget.buttonText,
                buttonWidthRatio: 0.9,
                // enabled: enterTransactionKey.currentState?.validate() ?? false,
                enabled: true,
                onPressed: () {
                  context.beamToNamed(widget.navigationRoute);
                },
              )
            : Container(),
      ],
    );
  }
}
