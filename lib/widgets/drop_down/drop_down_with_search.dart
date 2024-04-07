/// developed by Seniru for sunrise

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CustomDropDowWithSearch extends StatefulWidget {
  final List<String> itemList;
  final Function(String?)? selectedItem;
  final _multiKey = GlobalKey<DropdownSearchState<String>>();
  final double horizontalPadding;
  final double verticalPadding;
  final String dropdownTitle;
  final bool isRequired;
  final bool autofocus;
  final String selected;
  final bool isFullWidthOnWeb;

  CustomDropDowWithSearch({
    Key? key,
    required this.itemList,
    required this.selectedItem,
    this.horizontalPadding = 20,
    this.verticalPadding = 10,
    required this.dropdownTitle,
    required this.isRequired,
    this.isFullWidthOnWeb = false,
    this.autofocus = true,
    required this.selected,
  }) : super(key: key);

  @override
  State<CustomDropDowWithSearch> createState() =>
      _CustomDropDowWithSearchState();
}

class _CustomDropDowWithSearchState extends State<CustomDropDowWithSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (!widget.isFullWidthOnWeb && kIsWeb) ? 600 : double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding,
          vertical: widget.verticalPadding,
        ),
        child: Column(
          children: [
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
              ],
            ),

            DropdownSearch<String>(
                key: widget._multiKey,
                items: widget.itemList,
                selectedItem: widget.selected,
                onChanged: (String) {
                  widget.selectedItem!(String);
                },
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    hintText: "Search...",
                    filled: true,
                  ),
                ),
                popupProps: kIsWeb
                    ? PopupPropsMultiSelection.dialog(
                        listViewProps:
                            ListViewProps(padding: EdgeInsets.all(20)),
                        searchFieldProps: TextFieldProps(
                            style: TextStyle(fontSize: 14),
                            autofocus: widget.autofocus,
                            autofillHints: widget.itemList,
                            autocorrect: true),
                        showSearchBox: true,
                        fit: FlexFit.loose,
                      )
                    : PopupPropsMultiSelection.modalBottomSheet(
                        modalBottomSheetProps: const ModalBottomSheetProps(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                        ),
                        listViewProps:
                            ListViewProps(padding: EdgeInsets.all(20)),
                        searchFieldProps: TextFieldProps(
                            style: TextStyle(fontSize: 14),
                            autofocus: widget.autofocus,
                            autofillHints: widget.itemList,
                            autocorrect: true),
                        showSearchBox: true,
                        fit: FlexFit.loose,
                      )),
          ],
        ),
      ),
    );
  }
}
