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
      onPressed: onPressed,
      fillColor: Colors.red,
      splashColor: Colors.red[200],
      child: child,
      shape: const StadiumBorder(),
      );

  }
}