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
    final double blur = active ? 20:10;
    final double offset = active ? 8:3;
    final double top = active ? 70: 100;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
      decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey[900],
                      blurRadius: blur, 
                      spreadRadius: .5, 
                      offset: Offset(
                        offset, 
                        offset,
                      ))],
                    borderRadius: BorderRadius.all(Radius.circular(35))
                  ),
      child: child,
    );
  }
}