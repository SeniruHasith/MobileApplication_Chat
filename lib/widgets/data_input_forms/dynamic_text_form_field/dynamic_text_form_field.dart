import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


import '../../../values/colors.dart';
import '../../../values/strings.dart';

/// Project LKA_IBL_SUITE-WLT_MOBILE
/// Created by sahan on 2022-09-14 10:25 AM
class DynamicCommonTextFormField extends StatefulWidget {
  final String inputTitle;
  final String hintText;
  final ValidationType validationType;
  final Widget suffix;
  final Widget? prefix;
  final bool obscureText;
  final Function getEnteredValue;
  final KeyBoardType inputType;
  final int minLines;
  final int maxLines;
  final bool editable;
  final String initialText;
  final TextEditingController controller;
  final String repeatPasswordText;
  final String regex;
  final int maxLength;
  final int minLength;
  final bool readOnly;
  final FocusNode? componentFocusNode;
  final bool onEditing;

  DynamicCommonTextFormField(
      {required this.inputTitle,
      required this.suffix,
      required this.getEnteredValue,
      required this.hintText,
      required this.regex,
      required this.controller ,
      this.obscureText = false,
      this.editable = true,
      this.inputType = KeyBoardType.TEXT,
      this.minLines = 1,
      this.maxLines = 1,
      this.validationType = ValidationType.NORMAL,
      this.prefix,
      this.maxLength = 50,
      this.minLength = 2,
      this.componentFocusNode,
      this.initialText = '',
      this.repeatPasswordText = '',
      this.onEditing = false,
      this.readOnly = false});

  @override
  _DynamicCommonTextFormFieldState createState() =>
      _DynamicCommonTextFormFieldState();
}

class _DynamicCommonTextFormFieldState
    extends State<DynamicCommonTextFormField> {
  var maskFormatter = new MaskTextInputFormatter(
      mask: '####-##',
      filter: {"#": RegExp(r'\d')},
      type: MaskAutoCompletionType.lazy);

  var dateFormatter = new MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'\d')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      child: Center(
        child: TextFormField(
            readOnly: widget.readOnly,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                fontFamily: "Satoshi-Medium"),
            controller: widget.controller,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            focusNode: widget.componentFocusNode,
            keyboardType: getKeyBoardType(widget.inputType),
            obscureText: widget.obscureText,
            enabled: widget.editable,
            maxLength: widget.maxLength > 0 ? widget.maxLength : 50,
            cursorColor: Colors.transparent,
            onChanged: (value) {
              widget.getEnteredValue(value);
            },
            validator: (text) {
              if (text == null || text.isEmpty) {
                return "field_cannot_be_empty"
                    ;
              } else if (validateNormal(text, widget.regex)) {
                return null;
              } else {
                return "incorrect_input"
                    ;
              }
            },
            textAlignVertical: TextAlignVertical.center,
            minLines: widget.minLines,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              isDense: true,
              counterText: '',
              focusColor: AppColors.borderColor,
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.borderColor, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 10.0)),
              // labelText: AppLocalizations.of(context)!.translate(widget.inputTitle),
              labelStyle: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Satoshi-Medium',
                  fontWeight: FontWeight.bold),
              suffix: GestureDetector(
                onTap: () {},
                child: widget.suffix,
              ),
              prefixIcon: Padding(
                padding: widget.prefix != null
                    ? EdgeInsets.only(left: 10.0, right: 10)
                    : EdgeInsets.only(left: 0.0, right: 0),
                child: widget.prefix,
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 10, minHeight: 0),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                  fontSize: 16.0,
                  color: widget.readOnly ? AppColors.black : AppColors.grey,
                  fontWeight: FontWeight.w500),
            ),
            inputFormatters: getFormatter()),
      ),
    );
  }

  bool validateNormal(String text, String pattern) {
    RegExp regex = new RegExp(pattern);
    if (text.trim().isNotEmpty) {
      if (text.length < widget.minLength || text.length > widget.maxLength) {
        return false;
      }
    }
    return (!regex.hasMatch(text)) ? false : true;
  }

  getKeyBoardType(KeyBoardType keyboardType) {
    TextInputType textInputType = TextInputType.text;
    switch (keyboardType) {
      case KeyBoardType.NUM_ONLY:
        textInputType =
            TextInputType.numberWithOptions(signed: false, decimal: true);
        break;
      case KeyBoardType.NUM:
        textInputType = TextInputType.number;
        break;
      case KeyBoardType.TEXT:
        textInputType = TextInputType.text;
        break;
      case KeyBoardType.EMAIL:
        textInputType = TextInputType.emailAddress;
        break;
    }
    return textInputType;
  }

  getFormatter() {
    if (widget.validationType == ValidationType.AMOUNT) {
      return [
        CurrencyTextInputFormatter(
          decimalDigits: 2,
          symbol: " ",
        )
      ];
    } else if (widget.validationType == ValidationType.EXPIRE_DATE) {
      return [maskFormatter];
    } else if (widget.validationType == ValidationType.DATE) {
      return [dateFormatter];
    } else
      return null;
  }
}
