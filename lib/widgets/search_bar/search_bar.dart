import 'package:flutter/material.dart';
import '../../../values/colors.dart';
import '../../values/dimens.dart';

class SearchBar extends StatefulWidget {
  const SearchBar(
      {Key? key,
      required this.onChanged,
      required this.hintText,
      required this.controller,
      required this.onCancelTapped})
      : super(key: key);
  final Function onChanged;
  final String hintText;
   final TextEditingController controller;
  final VoidCallback onCancelTapped;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.25),
        ),
        borderRadius: BorderRadius.circular(commonFieldBorderRadius),
      ),
      child: Center(
        child: TextField(
          cursorColor: AppColors.enabledPrimaryButtonColorTheme,
          textAlign: TextAlign.left,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: widget.hintText,
            prefixIcon:  Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Icon(
                Icons.search,
                size: 28,
                color: Colors.black.withOpacity(0.25),
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                widget.controller.text="";
                widget.onCancelTapped();
              },
              child:  Icon(
                Icons.close,
                weight: 5,
                color: Colors.black.withOpacity(0.25),
              ),
            ),
            hintStyle: const TextStyle(
              color: Color(0xFF0B275D),
              fontSize: 16,
            ),
          ),
          onChanged: (value) {
            widget.onChanged(value);
          },
          onTap: () {},
        ),
      ),
    );
  }
}
