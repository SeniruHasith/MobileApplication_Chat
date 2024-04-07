import 'package:flutter/material.dart';

import 'info-item-widget.dart';

/// Project SLM_Wallet
/// Created by sahan on 2022-05-17 14:32
class InfoListWidget extends StatelessWidget {
  final items;
  final Color;

  const InfoListWidget({
    Key? key,
    required this.items,
    this.Color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.all(0.00),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return items[index]["value"] != null && items[index]["value"].trim() != ""
              ? InfoItemWidget(
                  color: Color,
                  title: items[index]["title"],
                  isCopyValue: items[index]["isCopyValue"],
                  isBold: items[index]["isBold"],
                  isExtraSpaceOnBottom: items[index]["isExtraSpaceOnBottom"],
                  changeColor: items[index]["changeColor"],
                  isLargeFont: items[index]["isLargeFont"],
                  isTitleLargeFont: items[index]["isTitleLargeFont"],
                  desc: items[index]["value"] ?? "")
              : Container();
        });
  }
}
