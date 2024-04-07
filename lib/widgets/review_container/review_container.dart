
import 'package:flutter/material.dart';

import '../../values/colors.dart';

class ReviewContainer extends StatelessWidget {
  final Widget child;

  ReviewContainer({Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.reviewColor,
      ),
        child: child,
    );
  }
}
