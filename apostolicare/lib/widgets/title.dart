import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget
{
  final String text;

  TitlePage({@required this.text});

  Widget build(BuildContext context)
    {
      return Container(
        padding: EdgeInsets.only(top: 10, left: 15),
        child:
        Align(
          alignment: Alignment.topLeft,
          child: Text(text,
                style: TextStyle(fontFamily: 'RobotoMono', 
                              fontWeight: FontWeight.bold, 
                              fontSize: 35,
                              color: Colors.black)
                )
        )
      );
    }
}
