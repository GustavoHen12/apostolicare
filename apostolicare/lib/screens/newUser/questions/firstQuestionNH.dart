import 'package:apostolicare/widgets/newUser/button.dart';
import 'package:apostolicare/widgets/newUser/card.dart';
import 'package:apostolicare/widgets/newUser/footer.dart';
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
    super.initState();
    //inicia lista com as perguntas
    //Widget test = _buildQuestion();
    items.add(_buildQuestion(1));
    items.add(_buildQuestion(2));
    items.add(_buildQuestion(3));
    items.add(_buildQuestion(4));

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

  


  Widget _buildQuestion(int index)
  { 
    return new SizedBox(
      height: double.infinity,
      child: Container(
      margin: EdgeInsets.only(top:35),
      child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      _buildText(),
      Container(
      margin: EdgeInsets.only(top: 20), 
      child: SizedBox(
        height: 200,
        child: Center(
          child: OptionsAswers()
          )
        )
      ),
      SizedBox(height: 25),
      _buildIndPag(index),
    ])
    ));
  }

  Widget _buildText()
  {
    return  Container( 
      padding: EdgeInsets.only(left: 10, right: 7),
      child: Text("Pergunta dúvida o que e isso ?",
                style: _settings.txtStyle,)
      );
  }

  Widget _buildIndPag(int index)
  {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
      child: FooterIndex(
        page: index,
        quantPages: 4,
      ),)));
  }

}

class OptionsAswers extends StatefulWidget {
  @override
  createState() {
    return new OptionsAswersState();
  }
}

class OptionsAswersState extends State<OptionsAswers> {
  List<ButtonModel> sampleData = new List<ButtonModel>();
  var _settings = new Rules();//para pegar as cores e texto

  @override
  void initState() {
    super.initState();
    sampleData.add(new ButtonModel('Botao1', false));
    sampleData.add(new ButtonModel('Botao2', false));
    sampleData.add(new ButtonModel('Botao3', false));
    sampleData.add(new ButtonModel('Botao4', false));
  }

  @override
  Widget build(BuildContext context) {
    return new 
      Container(
        child: new ListView.builder(
        addAutomaticKeepAlives: false,
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            splashColor: _settings.colorMiddleRed,
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.active = false);
                sampleData[index].active = true;
              });
            },
            child: new QuestionButton(sampleData[index]),
          );
          },
        ),
      );
  }
}