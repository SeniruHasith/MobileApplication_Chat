import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../values/colors.dart';
import '../../values/images.dart';

/// Project SLM_Wallet
/// Created by Praneeth on 2022-05-17 14:32
class InfoItemWidget extends StatelessWidget {
  Color color;
  final title;
  final desc;
  final ImageTitle;
  final image;
  bool isExtraSpaceOnBottom;
  bool isBold;
  bool isLargeFont;
  bool isTitleLargeFont;
  String? changeColor;
  bool? isCopyValue;

  InfoItemWidget({
    required this.title,
    required this.desc,
    this.ImageTitle,
    this.image,
    this.isCopyValue = false,
    this.isBold = false,
    this.isLargeFont = false,
    this.isTitleLargeFont = false,
    this.changeColor,
    this.isExtraSpaceOnBottom = false,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: (kIsWeb ? Colors.transparent : Colors.transparent),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      height: isExtraSpaceOnBottom == true ? 80 : 60,
      child: Row(
        mainAxisAlignment:
            (kIsWeb ? MainAxisAlignment.center : MainAxisAlignment.center),
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                height: 1.2,
                color: AppColors.appPrimaryColor,
                fontSize: isTitleLargeFont == true ? 16 : 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Satoshi-medium',
              ),
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(width: 40),
          Expanded(
            child: Text(desc,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: textColor(),
                    fontSize: isLargeFont == true ? 20 : 12,
                    fontFamily: 'Satoshi-medium',
                    fontWeight:
                        isBold == true ? FontWeight.bold : FontWeight.normal,
                    height: 1.2)),
          ),
          isCopyValue != null && isCopyValue == true
              ? GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(
                      ClipboardData(text: desc),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "${(title).replaceAll('\n', ' ')} copied to clipboard!’"),
                    ));
                  },
                  child: Image.asset(
                    AppImages.apple,
                    color: Colors.black,
                    height: 20,
                    fit: BoxFit.fitHeight,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Color? textColor() {
    switch (changeColor) {
      case 'green':
        return const Color(0xff279435);
      case 'red':
        return const Color(0xffC63338);
      default:
        return AppColors.black;
    }
  }

  dynamic getAmountWithoutDecimals(var amountWithDecimal) {
    return ((int.parse(amountWithDecimal) * 100) / 100);
  }
}
