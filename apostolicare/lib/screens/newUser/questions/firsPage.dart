import 'package:flutter/material.dart';

class Questions1 extends StatelessWidget
{
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 241, 238, 231),
     //backgroundColor: Colors.white,
      body: Center(
        child: new SafeArea(
        child: Column(children: <Widget>[
          
          RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Go back!'),
                  )
        ],
      )
        
        ),
      ),
    );
  }
}