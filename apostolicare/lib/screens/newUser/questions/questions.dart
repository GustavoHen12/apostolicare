import 'package:apostolicare/api/questionsApi.dart';
import 'package:apostolicare/screens/newUser/register/register.dart';
import 'package:apostolicare/widgets/SecundaryButton.dart';
import 'package:apostolicare/widgets/newUser/button.dart';
import 'package:apostolicare/widgets/newUser/card.dart';
import 'package:apostolicare/widgets/newUser/footer.dart';
import 'package:apostolicare/widgets/newUser/progressBar.dart';
import 'package:apostolicare/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:apostolicare/widgets/generalConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Questions extends StatefulWidget {
  final flag;
  Questions(this.flag);

  @override
  QuestionsState createState() => QuestionsState();
}

class QuestionsState extends State<Questions> {
  
  var _settings = new Rules();//para pegar as cores e texto

  //cada item da lista "items" e um card do questionario
  List items = new List();

 
  final ctrl = new PageController(
    initialPage: 0,
    viewportFraction: 0.8//"tamanho" da pagina
  );
  
  //para localizar qual é a página atual
  int currentPage = 0;

  //para posicionar corretamente a barra de progresso
  double _position = 0.0;

  @override
  void initState()
  {    
    super.initState();

    //inicia cards de pergunta
    loadQuestion();
    
    //para localizar a pergunta atual
    ctrl.addListener((){
      int next = ctrl.page.round();
      if(next != currentPage){
        setState((){currentPage = next;});
      }
    }
    );
  }

  //Api para pegar as perguntas
  var repository = new QuestinsApi();
  void loadQuestion() async{
    //se o usuario selecionar que pode ajudar
    List result = await repository.loadQuestionsCH();
    //se o ususario precisar de ajuda
    if(widget.flag == "needHelp")
      result = await repository.loadQuestionsNH();

    //constroi conteudo do card
    int length = result.length;
    setState(() {
      result.asMap().forEach((index, item) {
        items.add(_buildQuestion(index, length, item['question'], item['answers']));
      });
    });
  }

  //se o usuario preencheu todas as questoes seta para true
  bool _resp = false;
  //verifica se o usuario preencheu todo o questionario
  _checkReply() async{
    SharedPreferences data = await SharedPreferences.getInstance();
    //i funciona como indice
    //cada resposta esta no formato: {'i' : 'resposta'} (ver classe OptionsAswers)
    for(int i = 0; i < 4; i++){
      if((data.getString(i.toString()) ?? "0") == "0"){
        return;
      }
    }
    //se saiu do for significa que para as quatro perguntas tiveram resposta
    setState(() {
      _resp = true;
    });
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
            //header => nome da pag + barra de progresso
            _buildHeader(),
            //card => pergunta
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
        new ProgressBar(position: _position)
      ]),
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
          onPageChanged: (int index){
            //seta posicao da barra de progresso
            setState(() {
              _position = index.toDouble();
            });
          },
        )
      );
  }

  //constroi card de pergunta 
  //que e armazenado na lista "items"
  Widget _buildQuestion(int index, int length, String question, var answers)
  { 
    //index = numero da pagina (0 a 3)
    //length = quantidade total de paginas
    //question = pergunta
    //answers = resposta (objeto no format: {'i' : 'resposta'} - ver questionsApi) 
    return new SizedBox(
      height: double.infinity,
      child: Container(
        margin: EdgeInsets.only(top:35),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          //PERGUNTA
          _buildText(question),
          //RESPOSTAS
          Container(
            margin: EdgeInsets.only(top: 20), 
            child: SizedBox(
              height: 200,
              child: Center(
                child: OptionsAswers(answers, index)))),
          SizedBox(height: 25),//so para dar um espaco entre as respostas e o rodape
          //RODAPE DO CARD
          Flexible(child: _buildIndPag(index, length)),
        ])
    ));
  }

  Widget _buildText(String question)
  {
    return  Container( 
      padding: EdgeInsets.only(left: 10, right: 7),
      child: Text(question,
                style: _settings.txtStyle,)
      );
  }
  
  nextButton() async{
    //verifica se todas as respostas foram marcadas
    await _checkReply(); 
    if(_resp)
      //se foram vai para proxima pagina
      Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
    else
      //se nao exibe mensagem de erro
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('It seems that some question has not been answered'),
            actions: [
              FlatButton(
                onPressed: () => Navigator.pop(context, true), // passing true
                child: Text('Ok'),
              ),
            ],
          );
        }).then((exit) {
      if (exit == null) return;
      });
  }

  //indice da pagina = rodape da pagina
  Widget _buildIndPag(int index, int length)
  {
    Widget foot = FooterIndex(page: index, quantPages: length);
    //se for a ultima pagina coloca botao "next"
    if(index == length-1)
      foot = new SecundaryButton(
        onPressed: () async {
          nextButton();
        }, 
        child: Text("Next", style: TextStyle(fontFamily: 'RobotoMono', 
                                  fontWeight: FontWeight.bold, fontSize: 18,
                                  color: Colors.grey[700]),
                                  ));
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: foot,
        )
      )
    );
  }
}