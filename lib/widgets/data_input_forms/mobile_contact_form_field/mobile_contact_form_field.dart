import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:permission_handler/permission_handler.dart';


import '../../../values/colors.dart';
import '../../../values/dimens.dart';
import '../../../values/images.dart';
import '../../../values/strings.dart';
import '../../space/vertical_space.dart';

///developed by: Praneeth
///Common Mobile number Field
class MobileContactFormField extends StatefulWidget {
  final bool showContactLoadOption;
  final String dateFormTitle;
  final contactValidationTypes validateType;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function dateSelected;
  final Function(bool willShow) showLoading;
  final double horizontalPadding;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChange;
  final TextInputType inputType;
  final int maxLenght;
  final bool isRequired;
  final bool optional;


  MobileContactFormField({
    Key? key,
    this.validator,
    this.onChange,
    required this.showContactLoadOption,
    required this.dateFormTitle,
    required this.controller,
    this.focusNode,
    this.onEditingComplete,
    required this.dateSelected,
    this.optional = true,
    required this.showLoading,
    this.inputType = TextInputType.number,
    this.horizontalPadding = 0,
    this. maxLenght = 13,
    this.isRequired = false,
    this.validateType=contactValidationTypes.ALL
  }) : super(key: key);

  @override
  _MobileContactFormFieldState createState() => _MobileContactFormFieldState();
}

var errorText = '';

class _MobileContactFormFieldState extends State<MobileContactFormField> {
  Contact? _contact;
  String? _contactNumber;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding, vertical: 10),
        child: Column(
          children: [
            /// input field title
            Row(
              children: [
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
              ],
            ),

            /// spacing
            const VerticalSpace(height:commonGapFieldAndLabel),

            ///Form
            Focus(
              onFocusChange: (bool hasFocus) {},
              child: GestureDetector(
                onTap: () {},
                behavior: HitTestBehavior.opaque,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    TextFormField(
                      enabled: true,
                      focusNode: widget.focusNode,
                      controller: widget.controller,
                      maxLength: widget.maxLenght,
                      onChanged:  widget.onChange ?? (text){},
                      autocorrect: false,
                      keyboardType: widget.inputType,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Satoshi-Regular',
                      ),
                      cursorColor: AppColors.enabledPrimaryButtonColorTheme,
                      onTap: () {},
                      onEditingComplete: () {

                        FocusScope.of(context).requestFocus(FocusNode());
                        widget.onEditingComplete!();
                      },
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        counterText: "",
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(" +256"),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 0, minHeight: 0),
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
                      validator: widget.optional? widget.validator :
                          (text){

                        if (text == null || text.isEmpty) {
                          WidgetsBinding.instance
                              .addPostFrameCallback((_) {
                            if (!mounted) {
                              return;
                            } // Check if the widget is still mounted
                            setState(() {
                              errorText =
                                  "mobile_number_cannot_be_empty"
                                  ;
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
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 4),
                      child: widget.showContactLoadOption
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    FocusScope.of(context).requestFocus(widget.focusNode);
                                    widget.showLoading(true);
                                    await _askPermissions('');
                                  },
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: SvgPicture.asset(
                                        AppImages.contactIcon,
                                        fit: BoxFit.cover),
                                  ),
                                )
                              ],
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Future<void> _askPermissions(String routeName) async {
    PermissionStatus status = await Permission.contacts.status;

    if (!mounted) {
      return;
    }
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    if (isIOS == true) {
      setState(() {
        _pickContact();
      });
    } else {
      Permission.contacts.request();
      if (await Permission.contacts.request().isGranted) {
        setState(() {
           _pickContact();
        });

      } else {
        _handleInvalidPermissions(status);
      }
    }
  }

  Future<void> _pickContact() async {
    try {
      Contact? contact = await ContactsService.openDeviceContactPicker(
        iOSLocalizedLabels: false,
      );
      widget.showLoading(false);

        _contact = contact;
        _contactNumber = _contact!.phones!.first.value;

        String numberString = _contactNumber!.replaceAll(RegExp('[^0-9]'), '');
        widget.controller.text = numberString;

      WidgetsBinding.instance
          .addPostFrameCallback((_) {
        if (!validateMobile(numberString)){
          setState(() {
            errorText =
                "incorrect_mobile_number"
                ;
          });
        }
       else if (numberString.substring(0, 3) == "256") {
          widget.controller.text =
              numberString.replaceRange(0, 2, '').substring(0, 2) +
                  numberString.replaceRange(0, 2, '').substring(2, 6) +
                  numberString.replaceRange(0, 2, '').substring(6, 10);
          setState(() {
            errorText = "";
          });
        } else if (numberString.substring(0, 4) == "+256") {
          String _formattedNo = numberString.replaceRange(0, 4, '');
          widget.controller.text = _formattedNo.substring(0, 3) +
              _formattedNo.substring(2, 6) +
              _formattedNo.substring(6, 10);
          setState(() {
            errorText = "";
          });
        } else if (numberString[0] == "0") {
          String _formattedNo = numberString.replaceRange(0, 1, '');
          widget.controller.text =   _formattedNo.substring(0, _formattedNo.length);
          setState(() {
            errorText = "";
          });
        } else {
          widget.controller.text = numberString.substring(0, 2) +
              numberString.substring(2, 6) +
              numberString.substring(6, 10);
          setState(() {
            errorText = "";
          });

        }
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    widget.showLoading(false);
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    widget.showLoading(false);
    if (permissionStatus == PermissionStatus.denied) {
      Fluttertoast.showToast(
        msg: 'Access to contact data denied',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.8),
        textColor: Colors.white,
      );
    } else if (permissionStatus == PermissionStatus.restricted) {
      Fluttertoast.showToast(
        msg: 'Contact data not available on device',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black.withOpacity(0.8),
        textColor: Colors.white,
      );
    }
  }
}
bool validateMobile(String text) {
  RegExp regex = new RegExp(r'^(?:[+0]9)?[0-9]{9,10}$');
  return (!regex.hasMatch(text)) ? false : true;
}

bool checkPhoneNumberForOpt(String phoneNumber, String operator) {
  // Define the patterns for each operator
  Map<String, List<String>> operatorPatterns = {
    'MTN': ['25677', '25678', '2563', '25676'],
    'AIRTEL': ['25675', '25670', '25674'],
  };

  // Get the patterns associated with the provided operator
  List<String>? patterns = operatorPatterns[operator];

  // If no patterns found for the provided operator, return false
  if (patterns == null) {
    return false;
  }

  // Check if the phone number starts with any of the patterns
  for (String prefix in patterns) {
    if (phoneNumber.startsWith(prefix)) {
      return true;
    }
  }

  // Return false if no match is found
  return false;
}