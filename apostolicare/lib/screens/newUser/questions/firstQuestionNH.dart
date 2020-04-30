import 'package:apostolicare/widgets/newUser/card.dart';
import 'package:apostolicare/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:apostolicare/widgets/generalConfig.dart';


class QuestionsNH extends StatefulWidget {
  @override
  QuestionsNHState createState() => QuestionsNHState();
}

class QuestionsNHState extends State<QuestionsNH> {
  
  var _settings = new Rules();//para pegar as cores e texto
  List items = new List();

  final ctrl = new PageController(
    initialPage: 0,
    viewportFraction: 0.8
  );
  
  //para localizar qual é a página atual
  int currentPage = 0;

  @override
  void initState()
  {
    //inicia lista com as perguntas
    Widget test = _buildQuestion();
    items.add(test);
    items.add(test);
    items.add(test);
    items.add(test);

    //para localizar a pergunta atual
    ctrl.addListener((){
      int next = ctrl.page.round();
      if(next != currentPage){
        setState((){currentPage = next;});
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _settings.colorLight,
      body: new SafeArea(
        child:Center(
          child: 
          Column(
          children: <Widget>[
            _buildHeader(),
            _buildCard()
          ],
          )
      ),
    )
    );
  }

  Widget _buildHeader()
  {
    return Container(
      child: Column(children: <Widget>[
        new TitlePage(text: "New User"),
      ],),
    );
  }  


  Widget _buildCard()
  {
    return new Expanded(
        child: PageView.builder(
          controller: ctrl,
          itemCount: items.length,
          itemBuilder: (context, index){
            bool active = index == currentPage;
            return QuestionCard(child: items[index], active: active);
          },
        )
      );
  }

  Widget _buildQuestion()
  {
    return new Center(child: Container(
      child: Text("Question", style: _settings.txtStyle)
    ));
  }
}