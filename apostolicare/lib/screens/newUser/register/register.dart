import 'package:apostolicare/widgets/generalConfig.dart';
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

  var _settings = new Rules();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _settings.colorLight,
      body: new SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _getPhotoProfile(),
            _getPersonalData(),
            // _getEmail()
          ] 
        )
      ),
    );
  }
  
  Widget _buildHeader()
  {
    return Container(
      child: Column(children: <Widget>[
        new TitlePage(text: "New User"),
        new ProgressBar(position: 5)
      ]),
    );
  }

  Widget _getPhotoProfile()
  {
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

  Widget _getPersonalData(){
    return new Container( 
      //padding se reajusta para que o teclado nao fique
      //sobre a caixa de texto
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
      child: 
        SizedBox(
        width: SizeConfig.blockSizeHorizontal * 90,
        height: 130,

        child: WhiteContainers( 
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 290,
              child:
                //ENTRADA LOGIN
                TextFormField(
                decoration: const InputDecoration(
                  hintText: "Name"
                ),
                //alterar esse metodo para validar email
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter with your name';
                  }
                  return null;
                },
              )
            ),
            Container(
              width: 150,            
              child: 
              //ENTRADA SENHA
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Birthday"
                ),
                obscureText: true,
                //alterar esse metodo para validar senha
                validator: (value) {  
                  if (value.isEmpty) {
                    return 'Incorrect password';
                  }
                  return null;
                },
              )
            )
          ],
        ) 
      )
      )
    ));
  }
}