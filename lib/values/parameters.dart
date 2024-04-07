import 'package:flutter/material.dart';

class Parameters {
  static BoxShadow boxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.25),
    spreadRadius: 5,
    blurRadius: 5,
    offset: const Offset(0, 3), // sets the shadow to the top
  );
}
