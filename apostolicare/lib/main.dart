import 'package:apostolicare/my_icons_icons.dart';
import 'package:flutter/material.dart';
//arquivos de imagem e texto para testar
import 'api/messagesApi.dart';
//widget de mensagem basico
import 'widgets/messages.dart';

//tela inicial
import 'package:apostolicare/screens/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,//alterar cor
      ),
      home: Login(),
    );
  }
}