import 'package:flutter/material.dart';
import 'package:apostolicare/widgets/generalConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
//Constroi o conjunto de botoes
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
  //lista dos botoes
  List<ButtonModel> sampleData = new List<ButtonModel>();
  //para pegar as cores e texto
  var _settings = new Rules();

  @override
  void initState() {
    super.initState();

    _loadAnswers();  
  }

  String _reply;

  //carrega dados
  _loadAnswers() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    setState(() {
        _reply = (data.getString(widget.page.toString()) ?? "0");
    });
    //verifica se ja foi dada uma resposta
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


//ver : https://stackoverflow.com/questions/50060276/flutter-custom-radio-button
//constroi os botoes individualmente
class ButtonModel
{
  final String text;
  bool active;
  ButtonModel(this.text, this.active);
}
class QuestionButton extends StatefulWidget
{
  final ButtonModel item;
  QuestionButton(this.item);

  @override
  _QuestionButtonState createState() => _QuestionButtonState();
}

class _QuestionButtonState extends State<QuestionButton> {
  var _settings = new Rules();
  Widget build(BuildContext context)
  {
    var active = widget.item.active;

    return SizedBox(
      height: 45,
      width: double.infinity,
        child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        decoration: BoxDecoration(
                    color: active ? _settings.colorMiddleRed: Colors.white,
                    boxShadow: [BoxShadow(
                      color: active? Colors.grey[400]:Colors.transparent,
                      blurRadius: 6, 
                      spreadRadius: .5, 
                      offset: Offset(4, 0))],
                  ), 
        child: Center(child:Text(widget.item.text,
                    style: TextStyle(fontFamily: 'RobotoMono', 
                      fontWeight: FontWeight.bold, 
                      fontSize: 17.5,
                      color: active ? Colors.white: Colors.black
                    ),)) 
        )
    );
  }
}

