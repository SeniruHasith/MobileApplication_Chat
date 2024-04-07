import 'package:flutter/material.dart';

class ShimmerTextAnimation extends StatefulWidget {
  final String text;

  ShimmerTextAnimation({
    required this.text,
  });

  @override
  State<ShimmerTextAnimation> createState() => _ShimmerTextAnimationState();
}

class _ShimmerTextAnimationState extends State<ShimmerTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Animation? _animation;
  int updateStateCount = 0;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: (Duration(milliseconds: 1000)));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: -0.4, end: 1.4).animate(_animationController)
      ..addListener(() {
        if (updateStateCount > 5) {
          setState(() {});
          updateStateCount = 0;
        }
        {
          updateStateCount++;
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ShaderMask(
      child: Text(widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
      shaderCallback: (rect) {
        return LinearGradient(stops: [
          _animation?.value - 0.5,
          _animation?.value,
          _animation?.value + 0.5
        ], colors: [
          Colors.white.withOpacity(0.4),
          Colors.white,
          Colors.white.withOpacity(0.4),
        ]).createShader(rect);
      },
    ));
  }
}
