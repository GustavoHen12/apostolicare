import 'package:apostolicare/screens/home/dasboard.dart';
import 'package:apostolicare/social_icons_icons.dart';
import 'package:apostolicare/widgets/Mainbutton.dart';
import 'package:apostolicare/widgets/generalConfig.dart';
import 'package:apostolicare/widgets/newUser/progressBar2.dart';
import 'package:apostolicare/widgets/whiteContainer.dart';
import 'package:flutter/material.dart';
import 'package:apostolicare/widgets/title.dart';
import 'package:apostolicare/widgets/screenSize.dart';
import 'package:apostolicare/widgets/SecundaryButton.dart';

class RegisterCommunit extends StatefulWidget
{
  @override
  _RegisterCommunitState createState() => _RegisterCommunitState();
}

class _RegisterCommunitState extends State<RegisterCommunit> {
  var _settings = new Rules();


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: _settings.colorLight,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: new SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildText("Communit", 19),
            _buildInput(),
            _buildButton()
          ] 
        )
      ),
    );
  }

  Widget _buildText(String _text, double _size)
  {
    return Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(left:10, top: 15),
          child: Text(_text, style: _settings.txtStyleBold(_size)));
  }

  Widget _buildInput()
  {
    double _horizontalSize = SizeConfig.blockSizeHorizontal * 90;
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: SizedBox(
        width: _horizontalSize,
        child: WhiteContainers(
          child: Column(
            children: [
              _getCommunit(),
            ]
          )),),
    );
  }

  Widget _getCommunit()
  {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText("What is your communit", 15),
           Container(
             margin: EdgeInsets.only(top: 10),
             child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Communit name"
                ))),
        ]),
    );
  }

  Widget _buildHeader()
  {
    return Container(
      child: Column(children: <Widget>[
        new TitlePage(text: "New User"),
        new ProgressBarReg(positionIni: 7, positionFim: 8.5)
      ]),
    );
  }

  Widget _buildTextField()
  {
    return Container();
  }

  Widget _buildButton()
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: MainButton(
        onPressed: () {
          //tenta validar as entradas de texto
          // if (_formKey.currentState.validate()) {
          //   //PARA FAZER: enviar dados para banco de dados
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterCommunit()));
          // }
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }, 
        child: Text("Finish", style: TextStyle(fontFamily: 'RobotoMono', 
                      fontWeight: FontWeight.bold, 
                      fontSize: 19,
                      color: Colors.white))),
    );
  }
}