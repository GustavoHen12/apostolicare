import 'package:flutter/material.dart';

class Login extends StatelessWidget
{
  @override
  Widget build (BuildContext context)
  {
    return new Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 135, 113),
      body: new SafeArea(
            child:new Container(
            //degrade do fundo
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color.fromARGB(255, 232, 135, 113), Color.fromARGB(255, 238, 201, 189)])),
            //widgets
            child: new Center(
              child: Stack(
                children: [
                  _buildImage(),//imagem do fundo
                  //_buildActionArea(),//area onde tera as entradas e botoes
                ],
              )
            )
          )
      ));
  }

  Widget _buildImage()
  {
    return new Positioned(
      top: 0,
      left: 0,
      child: Container(
          height: 350,
          child: Image.asset('assets/logoLogin.png')
    )
    );
  }
}