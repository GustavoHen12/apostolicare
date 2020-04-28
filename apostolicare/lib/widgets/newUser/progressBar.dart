import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProgressBar extends StatefulWidget
{
  @override 
  ProgressBarState createState() => ProgressBarState();
}

class ProgressBarState extends State<ProgressBar>
{
  Widget build(BuildContext context)
  {
    return Container( 
    padding: EdgeInsets.only(top: 20, bottom: 30),
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
          Positioned(
            top: 0,
            left: 10,
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