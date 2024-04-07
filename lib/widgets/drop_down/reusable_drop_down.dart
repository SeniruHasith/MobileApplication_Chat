import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

import '../../values/colors.dart';
import '../../values/dimens.dart';

class ReusableDropDown extends StatelessWidget {
  const ReusableDropDown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.title = '',
    this.value,
    this.width,
  }) : super(key: key);

  final String title;
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onChanged;
  final dynamic value;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.trim().isNotEmpty) ...[
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Satoshi-Medium',
                color: Colors.black,
              ),
            ),
          ],
          /// spacing
          SizedBox(

            height:commonFieldHeight,
            child: DropdownButtonFormField(
              items: items,
              onChanged: onChanged,
              value: value,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.mainColorTheme,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(commonFieldBorderRadius),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.mainColorTheme,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(commonFieldBorderRadius),
                ),
              ),
              isExpanded: true,
            ),
          )
        ],
      ),
    );
  }
}
