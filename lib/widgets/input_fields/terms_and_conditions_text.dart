// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
//
// Widget termsAndConditionsText(BuildContext context, String text) {
//   return SizedBox(
//     width: MediaQuery.of(context).size.width,
//     height: kIsWeb ? MediaQuery.of(context).size.height * 0.4 : 450,
//     child: Markdown(
//       data: text,
//     ),
//   );
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget termsAndConditionsText(BuildContext context, String text) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: kIsWeb
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.height * 0.818,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: text
                          .replaceAll("â¢", "\u2022")
                          .replaceAll("â", "\u002D")
                          .split("dataprotection@")[0] +
                      "dataprotection@centenarybank.co.ug"
                          ""),
            ],
          ),
        ),
      ),
    ),
  );
}
