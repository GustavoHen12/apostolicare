import 'package:apostolicare/widgets/newUser/card.dart';
import 'package:flutter/material.dart';
import 'package:apostolicare/widgets/generalConfig.dart';

class firstQuestionNH extends StatelessWidget {
  
  var _settings = new Rules();//para pegar as cores e texto
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _settings.colorLight,
      body: Center(
        child: 
          Column(
          children: <Widget>[
            //_buildHeader,
            _buildCard()
          ],
          )
      ),
    );
  }

  Widget _buildCard()
  {
    return new QuestionCard(
      child: 
      Center(child:Text("TEXTO", style : _settings.txtStyle))
      );
  }
}