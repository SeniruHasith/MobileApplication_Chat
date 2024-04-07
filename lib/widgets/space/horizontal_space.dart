import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSpace extends StatelessWidget {
  final double? width;

  const HorizontalSpace({
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }

  static HorizontalSpace get xs => HorizontalSpace(width: 4.sp);

  static HorizontalSpace get sm => HorizontalSpace(width: 8.sp);

  static HorizontalSpace get md => HorizontalSpace(width: 16.sp);

  static HorizontalSpace get lg => HorizontalSpace(width: 32.sp);

  static HorizontalSpace get xl => HorizontalSpace(width: 64.sp);

  static HorizontalSpace get xxl => HorizontalSpace(width: 128.sp);
}
