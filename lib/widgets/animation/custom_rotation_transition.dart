import 'package:flutter/cupertino.dart';


class CustomRotationTransition extends StatefulWidget {

  final Widget ? child;
  CustomRotationTransition({
    Key ?key,
    required this.child,

  }) : super(key: key);

  @override
  _CustomRotationTransitionState createState() => _CustomRotationTransitionState();
}

class _CustomRotationTransitionState extends State<CustomRotationTransition> with TickerProviderStateMixin
{

  late AnimationController _controllerCircle ;
  @override
  void initState() {
    super.initState();
    // initialize controller
    _controllerCircle  =AnimationController(duration: const Duration(milliseconds: 1500), vsync: this,
        value: 0.0,
        lowerBound: 0.0,
        upperBound: 0.3);
    _controllerCircle.forward();
  }

  @override
  void dispose() {

    // dispose controller
    _controllerCircle.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return RotationTransition(
      turns: CurvedAnimation(parent: _controllerCircle, curve: Curves.easeInOut),
      child: widget.child,
    );
  }
}