import 'package:flutter/material.dart';

class CustomUpAndDownWidget extends StatefulWidget {
  const CustomUpAndDownWidget({
    this.duration = const Duration(milliseconds: 2000),
    this.deltaX = 20,
    this.curve = Curves.decelerate,
    required this.child,
  });

  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;

  @override
  _CustomUpAndDownWidgetState createState() => _CustomUpAndDownWidgetState();
}

class _CustomUpAndDownWidgetState extends State<CustomUpAndDownWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double shake(double value) =>
      2 * (0.2 - (0.5 - widget.curve.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, widget.deltaX * shake(controller.value)),
        child: child,
      ),
      child: widget.child,
    );
  }
}