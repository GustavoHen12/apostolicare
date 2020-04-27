import 'package:flutter/material.dart';

class Questions1 extends StatelessWidget
{
  static _txtStyle()
  {
    return TextStyle(fontFamily: 'RobotoMono', 
                      fontWeight: FontWeight.bold, 
                      fontSize: 19,
                      color: Color.fromARGB(255, 34, 32, 40));
  }

  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 241, 238, 231),
     //backgroundColor: Colors.white,
      body: Center(
        child: new SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitlePage(),
            //_buildProgressBar(),
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
                        style: _txtStyle(),
            )),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text("You:",
                          style: _txtStyle(),
            )),
          Container(
            child: new OptButton()
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
                          color: Color.fromARGB(255, 34, 32, 40),
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
                  onPressed: (){},                )
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
    _selected = 0;
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
                             setState(() {_selected = value;});
                          }
                    )
          ),
          ListTile(
            title: Text("Can Help", style: _txtStyle()),
            leading: Radio(value: 2, 
                          groupValue: _selected,
                          activeColor: Color.fromARGB(255, 34, 32, 40), 
                          onChanged: (int value){
                             setState(() {_selected = value;});
                          } 
                      )
          )
        ]
      )
    );
  }
}

