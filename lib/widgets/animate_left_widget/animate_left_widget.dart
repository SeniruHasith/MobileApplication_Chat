import 'package:flutter/material.dart';

import '../../values/images.dart';
import '../blend_mask_widget/blend_mask.dart';

/// Project SLM_Wallet
/// Created by sahan on 2022-05-17 14:32
///
/// updated by Rhylvin April 2023
class AnimateLeftWidget extends StatefulWidget {
  const AnimateLeftWidget({Key? key}) : super(key: key);

  @override
  _AnimateLeftWidgetState createState() => _AnimateLeftWidgetState();
}

class _AnimateLeftWidgetState extends State<AnimateLeftWidget> {
  double position = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        position = 1800;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            top: -120,
            right: -1200 + position,
            duration: const Duration(milliseconds: 25000),
            child: Center(
              child: SizedBox(
                height: 450,
                width: 2800,
                child: BlendMask(
                  blendMode: BlendMode.lighten,
                  opacity: 0.19,
                  child: Image.asset(
                    AppImages.clouds,
                    fit: BoxFit.contain,
                    // colorBlendMode: BlendMode.overlay,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
