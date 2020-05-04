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
  List items = new List();

 
  final ctrl = new PageController(
    initialPage: 0,
    viewportFraction: 0.8
  );
  
  //para localizar qual é a página atual
  int currentPage = 0;

  //para posicionar corretamente a barra de progresso
  double _position = 0.0;

  @override
  void initState()
  {    
    super.initState();
    //inicia lista com as perguntas
    //Widget test = _buildQuestion();
    // items.add(_buildQuestion(1));
    // items.add(_buildQuestion(2));
    // items.add(_buildQuestion(3));
    // items.add(_buildQuestion(4));

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

  var repository = new QuestinsApi();
  void loadQuestion() async{
    //se o usuario selecionar que pode ajudar
    List result = await repository.loadQuestionsCH();
    //se o ususario precisar de ajuda
    if(widget.flag == "needHelp")
      result = await repository.loadQuestionsNH();
    int length = result.length;
    setState(() {
      result.asMap().forEach((index, item) {
        items.add(_buildQuestion(index, length, item['question'], item['answers']));
      });
    });
  }

  bool _resp = false;
  _checkReply() async{
    String _reply = "";
    SharedPreferences data = await SharedPreferences.getInstance();
    for(int i = 0; i < 4; i++){
      if((data.getString(i.toString()) ?? "0") == "0"){
        return;
      }
    }
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
        new ProgressBar(
          position: _position,
        )
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
          onPageChanged: (int index){
            setState(() {
              _position = index.toDouble();
            });//seta posicao da barra de progresso
          },
        )
      );
  }

  


  Widget _buildQuestion(int index, int length, String question, var answers)
  { 
    return new SizedBox(
      height: double.infinity,
      child: Container(
      margin: EdgeInsets.only(top:35),
      child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      _buildText(question),
      Container(
      margin: EdgeInsets.only(top: 20), 
      child: SizedBox(
        height: 200,
        child: Center(
          child: OptionsAswers(answers, index)
          )
        )
      ),
      SizedBox(height: 25),
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
  
  // exibe o dialog
  
  Widget _buildIndPag(int index, int length)
  {
    Widget foot = FooterIndex(
        page: index,
        quantPages: length,
    );
    if(index == length-1)
      foot = new SecundaryButton(
        onPressed: () async {
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

class OptionsAswers extends StatefulWidget {
  final answers;
  final int page;
  OptionsAswers(this.answers, this.page);
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

    _loadAnswers();  
  }

  String _reply;

  //carrega dados
  _loadAnswers() async {
    //SharedPreferences.setMockInitialValues({});
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
        _reply = (data.getString(widget.page.toString()) ?? "0");
    });
    
    for(int i = 1; i <= 4; i++)
    {
      String index = i.toString();
      if(widget.answers[index] != "")
        if(_reply == widget.answers[index])
          sampleData.add(new ButtonModel(widget.answers[index], true));
        else
          sampleData.add(new ButtonModel(widget.answers[index], false));
    }
  }

  //Seta dados dependendo do botao pressionado
  _setAnswers(String answer) async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
      _reply = answer;
      data.setString(widget.page.toString(), _reply);
    });
  }


  @override
  Widget build(BuildContext context) {
    return new 
      Container(
        child: new ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            splashColor: _settings.colorMiddleRed,
            onTap: () {
              setState(() {
                //seta o botao
                sampleData.forEach((element) => element.active = false);
                sampleData[index].active = true;
                //coloca no banco de dados
                _setAnswers(sampleData[index].text);
              });
            },
            child: new QuestionButton(sampleData[index]),
          );
          },
        ),
      );
  }
}