import 'package:apostolicare/my_icons_icons.dart';
import 'package:flutter/material.dart';
//arquivos de imagem e texto para testar
import 'testData/messagesApi.dart';
//widget de mensagem basico
import 'widgets/messages.dart';

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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  HomeStates createState() => HomeStates();
}

class HomeStates extends State<Home>{
  List _messages = new List();
  var repository = new MessagesApi();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 238, 231),
      body: Column(
        children:[
          _buildAppBar(),
          _buildMessages(),
        ]
      ),
      floatingActionButton: _buildBottomButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  
    );
  }

  @override
  void initState() {
    loadMessages();
  }

  //Pegar Nome da Comunidade
  Widget _buildAppBar(){
    var communityName;
    communityName = "My Church";
    return Container(
      margin: EdgeInsets.only(top:35.0, bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(communityName,
              style: TextStyle(fontFamily: 'RobotoMono', 
              fontWeight: FontWeight.bold, fontSize: 30),),
          Icon(
            MyIcons.menuicon,
            size: 20,     //ADICIONAR AÇÃO
          )
        ],
        ),
    );
  }

  Widget _buildBottomButton()
  {
  return new Container(
    margin: EdgeInsets.only(bottom: 10),
    child:
    FloatingActionButton.extended(
        onPressed: () {
        },
        label: Text('NEW MESSAGE'),
        backgroundColor: Colors.red,
    ));
  }

  void loadMessages() async{
    List result = await repository.loadMessages();
    setState(() {
      result.forEach((item) {
        var message = new Messages(
          item['img'],
          item['name'],
          item['text']
          );
        _messages.add(message);
      });
    });
  }

  Widget _buildMessages()
  {
    return new Expanded(
        //   height:900,    
          child:
          SizedBox(
          height: 900,
          child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            )
          )  
    );
  }

}