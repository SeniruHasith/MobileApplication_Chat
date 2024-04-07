import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../values/colors.dart';
import '../../values/dimens.dart';
import '../space/vertical_space.dart';

///developed by: Rhylvin May 2023
class CommonDropdownButton extends StatefulWidget {
  final double verticalpadding;
  final String dropdownTitle;
  String currentValue;
  final double horizontalPadding;
  final FocusNode? focusNode;
  final List<String> valueList;
  final Function(String)? onValueChange;
  final bool disableDropdown;
  final int truncateLength;
  final void Function(String?)? onChanged;
  final double? height;
  final bool isRequired;

  CommonDropdownButton({
    Key? key,
    required this.dropdownTitle,
    this.horizontalPadding = 20,
    this.focusNode,
    required this.valueList,
    required this.currentValue,
    this.onValueChange,
    this.disableDropdown = false,
    this.truncateLength = 25,
    this.verticalpadding = 10.0,
    this.onChanged,
    this. isRequired = false,
    this.height = commonFieldHeight,
  }) : super(key: key);

  ///Modified by : Damith on 24th Feb
  ///Change height to fix the selected text not display issue fix 5428
  ///previous data 55:45

  @override
  _CommonDropdownButtonState createState() => _CommonDropdownButtonState();
}

class _CommonDropdownButtonState extends State<CommonDropdownButton> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding,
          vertical: widget.verticalpadding,
        ),
        child: Column(
          children: [
            VerticalSpace.md,
            /// dropdown field title
            Row(
              children: [
                /// input field title
                Row(
                  children: [
                    Text(
                      widget.dropdownTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Satoshi-Medium',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 5),
                    if(widget.isRequired ?? false )...[
                      const Text("*",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Satoshi-Medium',
                        color: Colors.red,
                      ))
                    ]
                  ],
                ),
              ],
            ),

            /// spacing
            const VerticalSpace(height:commonGapFieldAndLabel),

            /// dropdown button
            IgnorePointer(
              ignoring: widget.disableDropdown,
              child: SizedBox(
                height: widget.height,
                child: DropdownButtonFormField<String>(
                  value: widget.currentValue,
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
                  items: widget.valueList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: (kIsWeb ? 12 : 13),
                            fontFamily: 'Satoshi-Regular',
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: widget.onChanged ??
                      (String? value) {
                        setState(() {
                          widget.currentValue = value!;
                          widget.onValueChange!(value);
                        });
                      },
                  isExpanded: true,
                  alignment: AlignmentDirectional.bottomStart,
                ),
              ),
            ),
          ],
        ),
      );

  String truncateName(String value) {
    try {
      if (value.length > widget.truncateLength) {
        return '${value.substring(0, widget.truncateLength)}...';
      } else {
        return value;
      }
    } catch (e) {
      return value;
    }
  }
}
