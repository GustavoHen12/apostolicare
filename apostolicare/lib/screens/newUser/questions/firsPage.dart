import 'package:apostolicare/screens/newUser/questions/firstQuestionCH.dart';
import 'package:apostolicare/screens/newUser/questions/firstQuestionNH.dart';
import 'package:apostolicare/widgets/generalConfig.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Questions1 extends StatelessWidget
{
  static _txtStyle()
  {
    return TextStyle(fontFamily: 'RobotoMono', 
                      fontWeight: FontWeight.bold, 
                      fontSize: 19,
                      color: Color.fromARGB(255, 34, 32, 40));
  }

  var _settings = new Rules();

  Widget _options = new OptButton();

  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 241, 238, 231),
      body: Center(
        child: new SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitlePage(),
            _buildProgressBar(),
            _buildQuestions(),
            _buildButtons(context)
        ]),
      ),
    )
    );
  }

  Widget _buildTitlePage()
  {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15),
      child:
      Align(
        alignment: Alignment.topLeft,
        child: Text("New User",
              style: TextStyle(fontFamily: 'RobotoMono', 
                              fontWeight: FontWeight.bold, 
                              fontSize: 35,
                              color: Colors.black),
              )
      )
    );
  }

  Widget _buildProgressBar()
  {
    return Container( 
    padding: EdgeInsets.only(top: 20, bottom: 30),
    child: SizedBox(
      width: double.infinity,
      height: 10,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            child: SizedBox(
              height: 2,
              width: 360,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.black ),
            )
            ),
          Positioned(
            top: 0,
            left: 10,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.black)
            )
          ),
        ],
      ),
    )
    );

  }

  Widget _buildQuestions()
  {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 0),
            child: Text("First, we need some informations",
                        style: _settings.txtStyle,
            )),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text("You:",
                          style: _settings.txtStyle,
            )),
          Container(
            child: _options
          )
        ]
      ),
    );
  }

  Widget _buildButtons(_context)
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:7, vertical:45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
                IconButton(icon: Icon(Icons.arrow_back), 
                          iconSize: 45,
                          color: _settings.colorDark,
                          onPressed: (){
                            Navigator.pop(_context);
                          }
                ),
                FlatButton(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width:2.5))),
                    child:Text("Let's start", style: _txtStyle(),)),
                  //Vai para próxima pagina
                  onPressed: () async {
                    //pega os dados
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    int selected = (prefs.getInt('selected') ?? 0);
                    print(selected);
                    //Dependendo do valor selecionado
                    //vai para a pagina correspondente
                    if(selected == 1){
                      Navigator.push(_context,
                        MaterialPageRoute(builder: (context) => firstQuestionCH()));
                    }
                    else{
                      Navigator.push(_context,
                        MaterialPageRoute(builder: (context) => firstQuestionNH()));
                    }
                  },                )
              ])
    );
  }
}

class OptButton extends StatefulWidget
{
  @override 
  OptButtonsState createState() => OptButtonsState();
}

//botoes para selecionar se precisa de ajuda ou se podem ajudar
//o valor da resposta fica salvo em selected
class OptButtonsState extends State<OptButton>
{
  
  static _txtStyle()
  {
    return TextStyle(fontFamily: 'RobotoMono', 
                      fontWeight: FontWeight.bold, 
                      fontSize: 19,
                      color: Color.fromARGB(255, 34, 32, 40));
  }

  int _selected;

  @override
  void initState()
  {
    super.initState();
    _loadSelected();
  }

  //carrega dados
  _loadSelected() async {
    SharedPreferences.setMockInitialValues({});

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selected = (prefs.getInt('selected') ?? 0);
    });
  }

  //Seta dados dependendo do botao pressionado
  _setSelected(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selected = value;
      prefs.setInt('selected', _selected);
    });
  }

  Widget build(BuildContext context)
  {
    return new Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          ListTile(
            title: Text("Need Help", style: _txtStyle()),
            leading: Radio(value: 1, 
                          groupValue: _selected,
                          activeColor: Color.fromARGB(255, 34, 32, 40), 
                          onChanged: (int value){
                            _setSelected(value);
                          })
          ),
          ListTile(
            title: Text("Can Help", style: _txtStyle()),
            leading: Radio(value: 2, 
                          groupValue: _selected,
                          activeColor: Color.fromARGB(255, 34, 32, 40), 
                          onChanged: (int value){
                            _setSelected(value);
                          })
          )
        ]
      )
    );
  }

}

