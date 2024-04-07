import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedBottomBar extends StatelessWidget implements PreferredSizeWidget {
  Widget? content;
  RoundedBottomBar({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: preferredSize,
      child: LayoutBuilder(builder: (context, constraint) {
        final width = constraint.maxWidth * 13;
        return ClipRect(
          child: OverflowBox(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            child: SizedBox(
              width: width,
              height: width,
              child: Container(
                color: Colors.transparent,
                padding:
                    EdgeInsets.only(top: width / 2 - preferredSize.height / 3),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0x77404040),
                    shape: BoxShape.circle,
                  ),
                  child: content ?? Container(),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
