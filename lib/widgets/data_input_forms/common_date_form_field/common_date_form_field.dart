import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../../values/colors.dart';
import '../../../values/dimens.dart';

///developed by: Rhylvin March 2023
///date picker with the same ui as the common_text_form_field
class CommonDateFormField extends StatefulWidget {
  final String dateFormTitle;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function dateSelected;
  final double? horizontalPadding;
  final bool isRequired;

  const CommonDateFormField({
    Key? key,
    required this.dateFormTitle,
    required this.controller,
    this.focusNode,
    required this.dateSelected,
    this.isRequired = false,
    this.horizontalPadding = 0,
  }) : super(key: key);

  @override
  State<CommonDateFormField> createState() => _CommonDateFormFieldState();
}

var errorText = '';

class _CommonDateFormFieldState extends State<CommonDateFormField> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(1950),
            lastDate: DateTime(DateTime.now().year + 30))
        .then((DateTime? _selectedDate) async {
      if (_selectedDate != null) {
        // Do something with the selected date
        setState(() {
          DateFormat('MM/dd/yyyy').format(_selectedDate);
          selectedDate = _selectedDate;
          widget.controller.text = DateFormat('MM/dd/yyyy').format(selectedDate);
          widget.dateSelected(DateFormat('MM/dd/yyyy').format(selectedDate).toString());
        });
      } else {
        // Handle when the user cancels the selection
        print('Date selection was cancelled');
      }
      return null;
    });

    if (picked != null && picked != selectedDate) {
      print('date Selected');
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kIsWeb ? widget?.horizontalPadding ?? 0 : 20,
            vertical: 5),
        child: Column(
          children: [
            /// input field title
            Row(
              children: [
                Text(
                  widget.dateFormTitle,
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

            /// spacing
            const SizedBox(
              height: 8,
            ),

            /// date picker
            Focus(
              onFocusChange: (bool hasFocus) {},
              child: GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: kIsWeb?57:55,
                      child: TextFormField(
                        enabled: false,
                        focusNode: widget.focusNode,
                        controller: widget.controller,
                        autocorrect: false,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Satoshi-Regular',
                        ),
                        cursorColor: AppColors.enabledPrimaryButtonColorTheme,
                        onTap: () {},
                        onEditingComplete: () {
                          widget.focusNode?.unfocus();
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: errorText.isEmpty
                                    ? AppColors.mainColorTheme
                                    : Colors.red,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(commonFieldBorderRadius),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(commonFieldBorderRadius),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: errorText.isEmpty
                                    ? AppColors.mainColorTheme
                                    : Colors.red,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(commonFieldBorderRadius),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.date_range,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
