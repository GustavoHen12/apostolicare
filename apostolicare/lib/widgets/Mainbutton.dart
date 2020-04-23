import 'package:flutter/material.dart';

class MainButton extends StatelessWidget
{
  MainButton({@required this.onPressed, @required this.child});

  final GestureTapCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context)
  {
    return RawMaterialButton(
      padding: EdgeInsets.symmetric(horizontal:55, vertical: 13),
      onPressed: onPressed,
      fillColor: Colors.red,
      splashColor: Colors.red[200],
      child: child,
      shape: const StadiumBorder(),
      );

  }
}