import 'package:flutter/material.dart';

class Rules
{
  //Texto
  get txtStyle
  {
    return TextStyle(fontFamily: 'RobotoMono', 
                      fontWeight: FontWeight.bold, 
                      fontSize: 19,
                      color: Color.fromARGB(255, 34, 32, 40));
  }

  get txtStileTitle
  {
    return TextStyle(fontFamily: 'RobotoMono', 
                              fontWeight: FontWeight.bold, 
                              fontSize: 35,
                              color: Colors.black);
  }

  txtStyleBold(double size)
  {
    return TextStyle(fontFamily: 'RobotoMono', 
                      fontWeight: FontWeight.bold, 
                      fontSize: size,
                      color: Color.fromARGB(255, 34, 32, 40));
  }

  txtStyleNormal(double size)
  {
    return TextStyle(fontFamily: 'RobotoMono', 
                      fontWeight: FontWeight.normal, 
                      fontSize: size,
                      color: Color.fromARGB(255, 34, 32, 40));
  }

  //Cores
  Color get colorLight{
    return Color.fromARGB(255, 241, 238, 231);
  }

  Color get colorMiddleRed{
    return Color.fromARGB(255, 232, 135, 113);
  }

  Color get colorRed{
    return Color.fromARGB(255, 242, 41, 41);
  }

  Color get colorGrey{
    return Color.fromARGB(255, 151, 140, 138);
  }

  Color get colorDark{
    return Color.fromARGB(255, 34, 32, 40);
  }
}