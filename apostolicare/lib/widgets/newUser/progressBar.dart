import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProgressBar extends StatefulWidget
{
  final double position;
  ProgressBar({@required this.position});

  @override 
  ProgressBarState createState() => ProgressBarState();
}

class ProgressBarState extends State<ProgressBar>
{
  Widget build(BuildContext context)
  {
    double _inicialPosition = 30;
    return Container( 
    padding: EdgeInsets.only(top: 20),
    child: SizedBox(
      width: double.infinity,
      height: 10,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            //Expanded
            child: SizedBox(
              height: 2,
              width: 360,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.black ),
            )
            ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: 0,
            left: _inicialPosition + (widget.position*40),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.black)
            )
          ),
        ],
      ),
    )
    );

  }
}