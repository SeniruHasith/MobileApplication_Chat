import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../values/colors.dart';

/// Project SLM_Wallet
/// Created by sahan on 2021-12-10 10:46

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.backgroundColor
    ..backgroundColor = const Color(0xFFf0f0f1)
    ..indicatorColor = AppColors.backgroundColor
    ..textColor = AppColors.backgroundColor
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

loadCustomLoader(BuildContext context) async {
  await EasyLoading.show(
    status: 'Loading...',
    maskType: EasyLoadingMaskType.black,
  ).then((value) =>
      Future.delayed(const Duration(seconds: 80)).whenComplete(() async {
        await EasyLoading.dismiss();
      }));
}

hideCustomLoader(BuildContext context) async {
  await EasyLoading.dismiss();
}
