import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget
{
  QuestionCard({@required this.child});

  final Widget child;

  @override
  Widget build (BuildContext context)
  {
    return Expanded(child: 
      Align(
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: 3/4,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical:10),
            decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color.fromARGB(255, 232, 135, 113), Color.fromARGB(255, 238, 201, 189)]),
                          boxShadow: [BoxShadow(
                            color: Colors.grey[900],
                            blurRadius: 10.0, // has the effect of softening the shadow
                            spreadRadius: .5, // has the effect of extending the shadow
                            offset: Offset(
                              3.0, // horizontal, move right 10
                              3.0, // vertical, move down 10
                            ))],
                          border: Border.all(
                                  color: Colors.transparent,
                                  ),
                          borderRadius: BorderRadius.all(Radius.circular(35))
                        ),
            child: child,
    )
    )
    )
    );
  }
}