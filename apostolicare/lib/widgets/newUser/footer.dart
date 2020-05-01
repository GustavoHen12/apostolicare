import 'package:flutter/material.dart';

class FooterIndex extends StatelessWidget
{
  final int quantPages;
  final int page;
  
  FooterIndex({@required this.page, @required this.quantPages});

  Widget build(BuildContext context)
  {
    double largura = 12*quantPages.toDouble();
    return Container(
      child: SizedBox(
        height: 15,
        width: largura,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: quantPages,
          itemBuilder: (BuildContext context, int index){
            return SizedBox(
                  height:5,
                  child:
                  Container(
                  margin: EdgeInsets.symmetric(horizontal: 1),
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      color: index == (page-1)? Colors.black: Colors.transparent,
                      border: Border.all(width: 2, color: Colors.black),
                      shape: BoxShape.circle
                    ),
                  )
                  );
          }),),
    );
  }
}