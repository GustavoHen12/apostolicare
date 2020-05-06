import 'package:apostolicare/screens/newUser/register/register2.dart';
import 'package:apostolicare/widgets/SecundaryButton.dart';
import 'package:apostolicare/widgets/generalConfig.dart';
import 'package:apostolicare/widgets/newUser/progressBar2.dart';
import 'package:apostolicare/widgets/screenSize.dart';
import 'package:apostolicare/widgets/whiteContainer.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:apostolicare/widgets/newUser/progressBar.dart';
import 'package:apostolicare/widgets/title.dart';

class RegisterProfile extends StatefulWidget {
  @override
  _RegisterProfileState createState() => _RegisterProfileState();
}

class _RegisterProfileState extends State<RegisterProfile> {
  //PRA FAZER: estamos utilizando o image_picker para pegar a imagem do dispositivo
  //mas se em algum momento for colocado uma api do google ou facebook para fazer o cadastro
  //deve ser alterado o File _image
  File _image;

  //PRA FAZER: salvar a imagem no banco de dados
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  final _formKey = GlobalKey<FormState>();

  var _settings = new Rules();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _settings.colorLight,
      body: new SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            _buildHeader(),
            _getPhotoProfile(),
            _buildInputs(),
          ] 
        )
      )),
      resizeToAvoidBottomInset: true,
    );
  }
  
  Widget _buildHeader()
  {
    return Container(
      child: Column(children: <Widget>[
        new TitlePage(text: "New User"),
        new ProgressBarReg(positionIni:4 ,positionFim: 5)
      ]),
    );
  }


  Widget _getPhotoProfile(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Container(
          margin: EdgeInsets.only(left:10, top: 15),
          child: Text("Select a profile photo", style: _settings.txtStyle)),
        Center(
        child: Stack(
          children: <Widget>[
            _buildPhoto(),
            Positioned(
            right: 90,
            bottom: 4,
            child: SizedBox(
            height: 35,
            child: FloatingActionButton(
                backgroundColor: _settings.colorMiddleRed,
                onPressed: getImage,
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo, size: 25),
              )
            )),
          ],),
      )
    ]);
  }

  Widget _buildPhoto(){
    SizeConfig().init(context);
    double _size = SizeConfig.blockSizeHorizontal * 35;
    return Center(
      child: Container(
      margin: EdgeInsets.only(right: 10.0, left: 25.0, top: 15),
      height: _size,
      width: _size,
      child: ClipRRect(
          borderRadius:  BorderRadius.circular(50.0),
          child: new Container(
            decoration: _image == null
              ? new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 5, color:Colors.black))
              : new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 5, color:Colors.black),
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.topCenter,
                    image: FileImage(_image),
                )
            ),
          ),
        ),
      )
    );
  }


  Widget _buildInputs()
  {
    
    return Form(
      key: _formKey,
      child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(left:10, top: 20, bottom: 10),
                  child: Text("Please enter with your informations", style: _settings.txtStyle,),
                ),    
                _getPersonalData(),
                _getEmail(),
                _buildButton()
            ]),));
  }

  String _validatesName (value){
    if (value.isEmpty) {
      return 'Please Enter with your name';
    }
    return null;
  }

  String _validatesDate (value){
    if (value.isEmpty) {
      return 'Please Enter with your name';
    }
    return null;
  }

  String _validatesEmail (value){
    if (value.isEmpty) {
      return 'Invalid Email';
    }
    return null;
  }

  String _validatesPassword (value){
    if (value.isEmpty) {
      return 'Invalid Password';
    }
    return null;
  }
  //entrada para receber o nome e data de aniversario do novo usuário
  Widget _getPersonalData(){
    double _horizontalSize = SizeConfig.blockSizeHorizontal * 90;
    return new Container( 
      margin: EdgeInsets.only(top: 15),
      child: 
        SizedBox(
        width: _horizontalSize,
        height: 155,
        child: WhiteContainers( 
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: _horizontalSize - 20,
              child:
                TextFormField(
                  decoration: const InputDecoration( hintText: "Name"),
                  validator: (value){return _validatesName(value);},
                )
            ),
            Container(
              width: _horizontalSize - 180,            
              child: 
                //PARA FAZER: uma caixa de entrada estilizada para data de aniversário
                TextFormField(
                  decoration: const InputDecoration( hintText: "Birthday"),
                  validator: (value) { return _validatesDate(value);},
                )
              )
          ],
        ) 
      )
      )
    ));
  }

  Widget _getEmail(){
    double _horizontalSize = SizeConfig.blockSizeHorizontal * 90;
    return new Container( 
      margin: EdgeInsets.only(top: 30),
      child: 
        SizedBox(
        width: _horizontalSize,
        height: 155,
        child: WhiteContainers( 
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: _horizontalSize - 20,
              child:
                TextFormField(
                  decoration: const InputDecoration(icon: Icon(Icons.mail), hintText: "E-mail"),
                  validator: (value){return _validatesEmail(value);},
                )
            ),
            Container(
              width: _horizontalSize - 20,            
              child: 
                TextFormField(
                  decoration: const InputDecoration(icon: Icon(Icons.vpn_key), hintText: "Password"),
                  obscureText: true,
                  validator: (value) { return _validatesPassword(value);},
                )
              )
          ],
        ) 
      )
      )
    ));
  }

  Widget _buildButton()
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: SecundaryButton(
        onPressed: () {
          //tenta validar as entradas de texto
          if (_formKey.currentState.validate()) {
            //PARA FAZER: enviar dados para banco de dados
            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterContact()));
          }
        }, 
        child: Text("Next", style: _settings.txtStyle)),
    );
  }
}