import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../values/colors.dart';
import '../../../values/dimens.dart';
import '../../../values/strings.dart';
import 'package:flutter/foundation.dart';

import '../../space/vertical_space.dart';

///Updated and developed by: Rhylvin March 2023
class CommonTextFormField extends StatefulWidget {
  final Key? key;
  final Widget? prefixIcon;
  final double? buttonwight;
  final String inputTitle;
  final String hintText;
  final TextEditingController controller;
  final ValidationType validationType;
  final Widget suffix;
  final Widget? prefix;
  final bool obscureText;
  final Function(String a) onSubmitComplete;
  final KeyBoardType inputType;
  final int minLines;
  final int maxLines;
  final bool editable;
  final Function(String) onChanged;
  String? initialText = '';
  final String repeatPasswordText;
  int maxLength;
  int minLength;
  bool readOnly;
  final FocusNode? focusNode;
  bool onEditing;
  String allowedCharactersForPassword;
  double horizontalPadding;
  final TextAlign align;
  final Function() onEditingComplete;
  final bool? dontValidate;
  final double? maxAmount;
  final double? minAmount;
  final bool? optional;
  final bool? isRequired;
  final int passwordCapitalLetterLength;
  final int passwordSmallLetterLength;
  final int passwordSpecialCharacterLength;
  final int passwordNumberLength;
  final TextInputAction? textInputAction;
  final double verticalPadding;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;

  CommonTextFormField({
    required this.inputTitle,
    required this.controller,
    required this.suffix,
    this.prefixIcon,
    this.obscureText = false,
    this.editable = true,
    required this.onSubmitComplete,
    this.inputType = KeyBoardType.TEXT,
    required this.hintText,
    this.minLines = 1,
    this.maxLines = 1,
    this.validationType = ValidationType.NORMAL,
    this.prefix,
    this.maxLength = 50,
    this.minLength = 2,
    this.focusNode,
    this.initialText,
    this.repeatPasswordText = '',
    this.onEditing = false,
    this.readOnly = false,
    required this.onChanged,
    this.allowedCharactersForPassword = '',
    this.horizontalPadding = 20,
    this.align = TextAlign.start,
    required this.onEditingComplete,
    this.dontValidate = false,
    this.maxAmount,
    this.minAmount = 1,
    this.optional,
    this.passwordCapitalLetterLength = 1,
    this.passwordSmallLetterLength = 1,
    this.passwordSpecialCharacterLength = 1,
    this.passwordNumberLength = 1,
    this.buttonwight,
    this.key,
    this.textInputAction,
    this.verticalPadding = 10,
    this.suffixIcon,
    this.inputFormatters,
    this.isRequired,
    //this.textBoxAlingnmet = Alignment.topCenter,
    //this.errorText = "",
  });

  @override
  _CommonTextFormFieldState createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '####-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var dateFormatter = MaskTextInputFormatter(
      mask: '##/##/####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var errorText = "Field cannot be empty";

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding,
          vertical: widget.verticalPadding,
        ),
        child: Column(
          children: [
            /// input field title
            Row(
              children: [
                Text(
                  widget.inputTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Satoshi-Medium',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 5),
                if (widget.isRequired ?? false) ...[
                  const Text("*",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Satoshi-Medium',
                        color: Colors.red,
                      ))
                ]
              ],
            ),

            /// spacing
            const VerticalSpace(height: commonGapFieldAndLabel),

            /// input field
            Focus(
                onFocusChange: (bool hasFocus) {},
                child: SizedBox(
                  width: widget.buttonwight,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      TextFormField(
                        readOnly: widget.readOnly,
                        textInputAction:
                            widget.textInputAction ?? TextInputAction.next,
                        textAlign: widget.align,
                        focusNode: widget.focusNode,
                        controller: widget.controller,
                        autocorrect: false,
                        maxLength: widget.maxLength,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: getKeyBoardType(widget.inputType),
                        obscureText: widget.obscureText,
                        enabled: widget.editable,
                        style: TextStyle(
                          color: widget.editable ? Colors.black : Colors.grey,
                          fontSize: 16,
                          fontFamily: 'Satoshi-Regular',
                        ),
                        cursorColor: AppColors.enabledPrimaryButtonColorTheme,
                        onTap: () {},
                        onEditingComplete: () {
                          widget.focusNode?.unfocus();
                          FocusScope.of(context).requestFocus(FocusNode());
                          widget.onEditingComplete();
                        },
                        onChanged: widget.onChanged,
                        decoration: InputDecoration(
                          isDense: true,

                          ///Added content padding for web to match the other input fields on the web
                          contentPadding:
                              kIsWeb ? const EdgeInsets.all(22.0) : null,
                          counterText: "",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: widget.prefixIcon,
                          ),
                          suffixIcon: widget.suffixIcon,
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 0, minHeight: 0),
                          fillColor: widget.editable
                              ? Colors.white
                              : AppColors.grey.withOpacity(0.2),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: errorText.isEmpty
                                    ? AppColors.mainColorTheme.withOpacity(0.5)
                                    : AppColors.appPrimaryColor,
                                width: 2),
                            borderRadius:
                                BorderRadius.circular(commonFieldBorderRadius),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: errorText.isEmpty
                                    ? AppColors.mainColorTheme
                                    : Colors.red,
                                width: 2.0),
                            borderRadius:
                                BorderRadius.circular(commonFieldBorderRadius),
                          ),
                        ),
                        validator: widget.optional ?? false
                            ? (text) {
                                String _text = text ?? '';
                                if (_text.length > 0) {
                                  if (_text.length < widget.minLength ||
                                      _text.length > widget.maxLength) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      if (!mounted) {
                                        return;
                                      } // Check if the widget is still mounted
                                      setState(() {
                                        errorText = "Incorrect Input";
                                      });
                                    });
                                    return errorText;
                                  } else {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      if (!mounted) {
                                        return;
                                      } // Check if the widget is still mounted
                                      setState(() {
                                        errorText = '';
                                      });
                                    });
                                    return null;
                                  }
                                }
                              }
                            : widget.dontValidate ?? false
                                ? (text) {
                                    String _text = text ?? '';
                                    if (_text.length < widget.minLength ||
                                        _text.length > widget.maxLength) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        if (!mounted) {
                                          return;
                                        } // Check if the widget is still mounted
                                        setState(() {
                                          errorText = "incorrect_input";
                                        });
                                      });
                                      return errorText;
                                    } else {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        if (!mounted) {
                                          return;
                                        } // Check if the widget is still mounted
                                        setState(() {
                                          errorText = '';
                                        });
                                      });
                                      return null;
                                    }
                                  }
                                : (text) {
                                    if (widget.validationType ==
                                        ValidationType.EMAIL) {
                                      if (text == null || text.isEmpty) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = "email_cannot_be_empty";
                                          });
                                        });
                                        return errorText;
                                      } else if (validateEmail(text)) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = '';
                                          });
                                        });
                                        return null;
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText =
                                                "incorrect_email_address";
                                          });
                                        });
                                        return errorText;
                                      }
                                    } else if (widget.validationType ==
                                        ValidationType.NORMAL) {
                                      if (text == null || text.isEmpty) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = "field_cannot_be_empty";
                                          });
                                        });
                                        return errorText;
                                      } else if (validateNormal(text)) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = '';
                                          });
                                        });
                                        return null;
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = ("incorrect_input");
                                          });
                                        });
                                        return errorText;
                                      }
                                    } else if (widget.validationType ==
                                        ValidationType.ONLY_LETTERS) {
                                      if (text == null || text.isEmpty) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = "incorrect_input";
                                          });
                                        });
                                        return errorText;
                                      } else if (validateOnlyLetters(text)) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = '';
                                          });
                                        });
                                        return null;
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = "incorrect_input";
                                          });
                                        });
                                        return errorText;
                                      }
                                    } else if (widget.validationType ==
                                        ValidationType.ONLY_NUMBERS) {
                                      if (text == null || text.isEmpty) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = "field_cannot_be_empty";
                                          });
                                        });
                                        return errorText;
                                      } else if (validateOnlyNumbers(text)) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = '';
                                          });
                                        });
                                        return null;
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = "incorrect_input";
                                          });
                                        });
                                        return errorText;
                                      }
                                    } else if (widget.validationType ==
                                        ValidationType.PASSWORD) {
                                      if (text == null || text.isEmpty) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText =
                                                "password_cannot_be_empty";
                                          });
                                        });
                                        return errorText;
                                      } else if (validatePW(text)) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = '';
                                          });
                                        });
                                        return null;
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText =
                                                "incorrect_password_format";
                                          });
                                        });
                                        return errorText;
                                      }
                                    } else if (widget.validationType ==
                                        ValidationType.MOBILE) {
                                      if (text == null || text.isEmpty) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText =
                                                "mobile_number_cannot_be_empty";
                                          });
                                        });
                                        return errorText;
                                      } else if (validateMobile(text)) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = '';
                                          });
                                        });
                                        return null;
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText =
                                                "incorrect_mobile_number";
                                          });
                                        });
                                        return errorText;
                                      }
                                    } else if (widget.validationType ==
                                        ValidationType.TELEPHONE) {
                                      if (text == null || text.isEmpty) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText =
                                                "telephone_number_cannot_be_empty";
                                          });
                                        });
                                        return errorText;
                                      } else if (validateMobile(text)) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = '';
                                          });
                                        });
                                        return null;
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText =
                                                "incorrect_telephone_number";
                                          });
                                        });
                                        return errorText;
                                      }
                                    } else if (widget.validationType ==
                                        ValidationType.NIC) {
                                      if (text == null || text.isEmpty) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = "nic_cannot_be_empty";
                                          });
                                        });
                                        return errorText;
                                      } else if (validateNIC(text)) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = '';
                                          });
                                        });
                                        return null;
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = "incorrect_nic";
                                          });
                                        });
                                        return errorText;
                                      }
                                    } else if (widget.validationType ==
                                        ValidationType.REPEAT_PASSWORD) {
                                      if (text == null || text.isEmpty) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText =
                                                "password_cannot_be_empty";
                                          });
                                        });
                                        return errorText;
                                      } else if (text !=
                                          widget.repeatPasswordText) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText =
                                                "password_does_not_match";
                                          });
                                        });
                                        return errorText;
                                      } else if (validatePW(text)) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = '';
                                          });
                                        });
                                        return null;
                                      }
                                    } else if (widget.validationType ==
                                        ValidationType.AMOUNT) {
                                      if (text == null || text.isEmpty) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText =
                                                "amount_cannot_be_empty";
                                          });
                                        });
                                        return errorText;
                                      } else if (validateAmount(text)) {
                                        if (!validateAmountMax(text)) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            if (!mounted) {
                                              return;
                                            } // Check if the widget is still mounted
                                            setState(() {
                                              errorText = "not_enough_balance";
                                            });
                                          });

                                          return errorText;
                                        } else {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            if (!mounted) {
                                              return;
                                            } // Check if the widget is still mounted
                                            setState(() {
                                              errorText = '';
                                            });
                                          });
                                          return null;
                                        }
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = "incorrect_amount";
                                          });
                                        });
                                        return errorText;
                                      }
                                    } else if (widget.validationType ==
                                        ValidationType.QRAMOUNT) {
                                      if (text == null || text.isEmpty) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText =
                                                "amount_cannot_be_empty";
                                          });
                                        });
                                        return errorText;
                                      } else if (validateAmount(text)) {
                                        if (!validateAmountMax(text)) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            if (!mounted) {
                                              return;
                                            } // Check if the widget is still mounted
                                            setState(() {
                                              errorText = "not_enough_balance";
                                            });
                                          });

                                          return errorText;
                                        } else {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            if (!mounted) {
                                              return;
                                            } // Check if the widget is still mounted
                                            setState(() {
                                              errorText = '';
                                            });
                                          });
                                          return null;
                                        }
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = "incorrect_amount";
                                          });
                                        });
                                        return errorText;
                                      }
                                    } else if (widget.validationType ==
                                        ValidationType.OTHER_NAME) {
                                      if (validateOtherName(text!)) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = '';
                                          });
                                        });
                                        return null;
                                      } else {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          if (!mounted) {
                                            return;
                                          } // Check if the widget is still mounted
                                          setState(() {
                                            errorText = "incorrect_other_name";
                                          });
                                        });
                                        return errorText;
                                      }
                                    }
                                    if (text == null ||
                                        text.isEmpty ||
                                        (text.length < 2)) {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        if (!mounted) {
                                          return;
                                        } // Check if the widget is still mounted
                                        setState(() {
                                          errorText = "text_is_empty";
                                        });
                                      });
                                      return errorText;
                                    } else if (widget.validationType ==
                                        ValidationType.TEXT_NOT_REQUIRED) {
                                      return null;
                                    }
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      if (!mounted) {
                                        return;
                                      } // Check if the widget is still mounted
                                      setState(() {
                                        errorText = '';
                                      });
                                    });
                                    return null;
                                  },
                        inputFormatters:
                            widget.inputFormatters ?? getFormatter(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 10, bottom: errorText.isEmpty ? 0 : 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.suffix,
                          ],
                        ),
                      ),
                      widget.validationType == ValidationType.AMOUNT ||
                              widget.validationType == ValidationType.QRAMOUNT
                          ? Padding(
                              padding: EdgeInsets.only(
                                  top: 20,
                                  left: 20,
                                  bottom: errorText.isEmpty ? 20 : 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  widget.prefix ?? Container(),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                )),
          ],
        ),
      );

  bool validateOnlyLetters(String value) {
    if (value.length < widget.minLength || value.length > widget.maxLength) {
      return false;
    }
    RegExp regex = new RegExp(r'^[a-zA-Z ]+$');
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validateOnlyNumbers(String value) {
    if (value.length < widget.minLength || value.length > widget.maxLength) {
      return false;
    }
    RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(value);
  }

  bool validateEmail(String value) {
    if (value.length < widget.minLength || value.length > widget.maxLength) {
      return false;
    }
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validateNormal(String text) {
    RegExp regex = RegExp(r"^[0-9a-zA-Z].*");
    if (text.trim().isNotEmpty) {
      if (text.length < widget.minLength || text.length > widget.maxLength) {
        return false;
      }
    }
    return (!regex.hasMatch(text)) ? false : true;
  }

  bool validatePW(String password) {
    int capitalLetter = widget.passwordCapitalLetterLength;
    int smallLetter = widget.passwordSmallLetterLength;
    int specialCharacter = widget.passwordSpecialCharacterLength;
    int number = widget.passwordNumberLength;
    int minCharacterLength = widget.minLength;
    int maxCharacterLength = widget.maxLength;

    // Escape characters that have special meaning within a regular expression character class
    String pattern =
        '^(?=.*[A-Z]{${capitalLetter.toString()}})(?=.*[a-z]{${smallLetter.toString()}})(?=.*[!@#\$%^&*(),.?":{}|<>]{${specialCharacter.toString()}})(?=.*[0-9]{${number.toString()}}).{$minCharacterLength,$maxCharacterLength}\$';
    RegExp passwordRegex = RegExp(pattern);
    return passwordRegex.hasMatch(password);
  }

  bool validateMobile(String text) {
    RegExp regex = new RegExp(r'^(?:[+0]9)?[0-9]{9,10}$');
    return (!regex.hasMatch(text)) ? false : true;
  }

  bool validateNIC(String text) {
    if (text.length < widget.minLength || text.length > widget.maxLength) {
      return false;
    }
    RegExp regex = RegExp(r'^C[MF]\d{2}[A-Z0-9]{10}$', caseSensitive: false);
    // RegExp regexSimple = new RegExp(r'^C[MF]\d{2}[A-Z0-9]{10}$');
    return (!regex.hasMatch(text.toUpperCase())) ? false : true;
  }

  bool validateAmount(String text) {
    ///minAmount
    double minAmount = widget.minAmount ?? 1;
    try {
      if (!(minAmount <= double.parse(text.replaceAll(',', '')))) {
        return false;
      }
      RegExp regex = new RegExp(r'^\$?(\d{1,3}(,\d{3})*|(\d+))(.\d{2})?$');

      return (!regex.hasMatch(text)) ? false : true;
    } catch (e) {
      return false;
    }
  }

  bool validateAmountMax(String text) {
    double maxAmount = widget.maxAmount ?? 0;
    double currentAmount = double.parse(text.replaceAll(',', ''));
    if (maxAmount < currentAmount) {
      return false;
    } else {
      return true;
    }
  }

  bool validateOtherName(String text) {
    if (text.length < widget.minLength || text.length > widget.maxLength) {
      return false;
    }
    RegExp regex = new RegExp(r'^[a-zA-Z0-9]+$');
    bool value;
    if (text.trim().isNotEmpty) {
      if (!regex.hasMatch(text)) {
        value = false;
      } else {
        value = true;
      }
    } else {
      value = true;
    }
    return value;
  }

  getKeyBoardType(KeyBoardType keyboardType) {
    TextInputType textInputType = TextInputType.text;
    switch (keyboardType) {
      case KeyBoardType.NUM_ONLY:
        textInputType =
            const TextInputType.numberWithOptions(signed: true, decimal: true);
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
      case KeyBoardType.TELEPHONE:
        textInputType = TextInputType.phone;
        break;
    }
    return textInputType;
  }

  getFormatter() {
    if (widget.validationType == ValidationType.QRAMOUNT) {
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
    } else if (widget.validationType == ValidationType.MOBILE) {
      return [LengthLimitingTextInputFormatter(10)];
    } else if (widget.validationType == ValidationType.NIC) {
      return [LengthLimitingTextInputFormatter(14)];
    } else {
      return null;
    }
  }
}
