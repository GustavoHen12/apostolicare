import 'package:flutter/material.dart';

class SecundaryButton extends StatelessWidget
{
  SecundaryButton({@required this.onPressed, @required this.child});

  final GestureTapCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context)
  {
    return OutlineButton(
      borderSide: BorderSide(
        color: Colors.red[300],
        width: 4
      ),
      padding: EdgeInsets.symmetric(horizontal:55, vertical: 13),
      onPressed: onPressed,
      color: Colors.red[300],
      //fillColor: Colors.transparent,
      //splashColor: Colors.red[200],
      child: child,
      shape: const StadiumBorder(),
      );

  }
}