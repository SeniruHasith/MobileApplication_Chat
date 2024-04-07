import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../values/colors.dart';
import '../../values/images.dart';

/// Project SLM_Wallet
/// Created by Praneeth on 2022-05-17 14:32
class InfoListContainer extends StatelessWidget {
  Widget childWidget;

  InfoListContainer({
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x5eeaeaea),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(padding: const EdgeInsets.all(14.0), child: childWidget),
    );
  }
}
