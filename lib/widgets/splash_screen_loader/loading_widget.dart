import 'package:flutter/material.dart';

class AnimatedChase extends StatefulWidget {
  @override
  _AnimatedChaseState createState() => _AnimatedChaseState();
}

class _AnimatedChaseState extends State<AnimatedChase>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ChasePainter(_controller.value),
          size: Size(100, 100),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ChasePainter extends CustomPainter {
  final double animationValue;

  ChasePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue // Replace with your desired color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    double radius = 30;
    double offset = 40;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2 - offset), radius,
        paint..color = Colors.blue);
    canvas.drawCircle(Offset(size.width / 2, size.height / 2 + offset), radius,
        paint..color = Colors.blue);

    double rotation = 360 * animationValue;
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(rotation * 3.1415927 / 180.0);
    canvas.drawCircle(Offset(0, -offset), radius, paint..color = Colors.blue);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
