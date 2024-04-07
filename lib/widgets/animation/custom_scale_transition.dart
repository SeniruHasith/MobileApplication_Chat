import 'package:flutter/cupertino.dart';


class CustomScaleTransition extends StatefulWidget {

  final Widget ? child;
  final Tween<double> _tween = Tween(begin: 0.8, end: 1);
  CustomScaleTransition({
    Key ?key,
    required this.child,

  }) : super(key: key);

  @override
  _CustomScaleTransitionState createState() => _CustomScaleTransitionState();
}

class _CustomScaleTransitionState extends State<CustomScaleTransition> with TickerProviderStateMixin
{

  late AnimationController _controllerPeople ;
  @override
  void initState() {
    super.initState();
    // initialize controller
    _controllerPeople  =AnimationController(duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);
    _controllerPeople.forward();
  }

  @override
  void dispose() {

    // dispose controller
    _controllerPeople.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return ScaleTransition(
      scale: widget._tween.animate(CurvedAnimation(parent: _controllerPeople, curve: Curves.easeInOut)),
      alignment: Alignment.bottomCenter,
      child: widget.child,
    );
  }
}