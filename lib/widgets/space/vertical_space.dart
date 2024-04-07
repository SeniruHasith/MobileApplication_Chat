import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpace extends StatelessWidget {
  final double? height;

  const VerticalSpace({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }

  static VerticalSpace get xs => VerticalSpace(height: 4.sp);

  static VerticalSpace get sm => VerticalSpace(height: 8.sp);

  static VerticalSpace get md => VerticalSpace(height: 16.sp);

  static VerticalSpace get lg => VerticalSpace(height: 32.sp);

  static VerticalSpace get xl => VerticalSpace(height: 64.sp);

  static VerticalSpace get xxl => VerticalSpace(height: 128.sp);
}
