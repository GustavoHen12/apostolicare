import 'package:flutter/material.dart';

class WhiteContainers extends StatelessWidget
{
  WhiteContainers({@required this.child});

  final Widget child;

  @override
  Widget build (BuildContext context)
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical:5),
      decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey[900],
                      blurRadius: 10.0, // has the effect of softening the shadow
                      spreadRadius: .1, // has the effect of extending the shadow
                      offset: Offset(
                        2.0, // horizontal, move right 10
                        2.0, // vertical, move down 10
                      ))],
                    border: Border.all(
                            color: Colors.white,
                            ),
                    borderRadius: BorderRadius.all(Radius.circular(35))
                  ),
      child: child,
    );
  }
}