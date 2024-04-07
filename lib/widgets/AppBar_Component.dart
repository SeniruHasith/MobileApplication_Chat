import 'dart:js';

import 'package:flutter/material.dart';

Widget AppBarWidget(
    {String? title, Widget? frontIcon, bool? backButtonEnabled,Widget? NavigationPage}) {
  return AppBar(
    leading: backButtonEnabled ?? false
        ? GestureDetector(
      onTap: (){
        //Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationPage()));
      },
          child: Container(
              color: Colors.grey.withOpacity(0.2),
              width: 50,
              height: 50,
              child: Center(
                  child: Icon(
                Icons.chevron_left,
                color: Colors.black,
              ))),
        )
        : frontIcon,
    title: Text(title ?? ""),
  );
}
