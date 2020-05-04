import 'package:apostolicare/widgets/screenSize.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget
{
  final Widget child;
  final bool active;
  QuestionCard({@required this.child, @required this.active});


  @override 
  Widget build (BuildContext context)
  {
    final double blur = active ? 10:15;
    final double offset = active ? 2:1;
    final double top = active ? 55: 85;
    final double bottom = active ? 50: 55;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: bottom, right: 30),
      decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: blur, 
                      spreadRadius: .1, 
                      offset: Offset(
                        offset, 
                        offset,
                      ))],
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
      child: child,
    );
  }
}