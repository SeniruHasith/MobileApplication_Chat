import 'package:flutter/material.dart';

import '../../values/colors.dart';

class CommonCheckBox extends StatelessWidget {
  const CommonCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  final bool? value;
  final void Function(bool?)? onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          width: 25,
          height: 25,
          child: Checkbox(
            value: value,
            activeColor: AppColors.checkBoxColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onChanged: onChanged,
          ),
        ),
        //HorizontalSpace.xs,
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.secondaryBackgroundColor,
          ),
        ),
      ],
    );
  }
}
