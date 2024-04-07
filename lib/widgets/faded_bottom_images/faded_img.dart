import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class faded_bottom extends StatelessWidget {
  final String height;
  final Image image;
  const faded_bottom(
      {Key? key, required this.height, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ShaderMask(
        shaderCallback: (rect) {    return const LinearGradient(
          begin: Alignment.topCenter,      end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        blendMode: BlendMode.dstIn,
        child: faded_bottom(
          image: image,
          height: height,
        ),
      );
  }
}
