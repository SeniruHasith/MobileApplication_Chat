import 'package:flutter/material.dart';
import '../../../values/app_text_styles.dart' as styles;

class TextButtonComponent extends StatelessWidget {
  final Function onTap;
  final String text;
  final MainAxisAlignment mainAxisAlignment;
  const TextButtonComponent({
    Key? key,
    required this.onTap,
    required this.text,
    required this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
            child: InkWell(
              onTap: () {
                onTap();
              },
              child: Text(
                text,
                style: styles.textButton14Bold,
              ),
            ),
          )
        ],
      );
}
