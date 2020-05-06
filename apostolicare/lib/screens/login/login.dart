import 'package:apostolicare/screens/newUser/questions/firsPage.dart';
import 'package:apostolicare/screens/newUser/register/register.dart';
import 'package:apostolicare/widgets/Mainbutton.dart';
import 'package:apostolicare/widgets/SecundaryButton.dart';
import 'package:apostolicare/widgets/whiteContainer.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget
{
  @override
  Widget build (BuildContext context)
  {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromARGB(255, 232, 135, 113),
      body: new SafeArea(
            child:new Container(
            //degrade e imagem do fundo
            decoration: BoxDecoration(
                image: DecorationImage(
                  //image: ResizeImage(AssetImage('assets/logoLogin.png'), height: 330,),
                  image: AssetImage('assets/logoLogin.png'),
                  alignment: Alignment.topLeft),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color.fromARGB(255, 232, 135, 113), Color.fromARGB(255, 238, 201, 189)])),
            //widgets
            child: new SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child:  new LoginForm()
                )
              )
            )
          )
      )
    );
  }
}

//compoe todas as partes relevantes para o login
//como a caixa de texto e os botoes
class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {

  //ver: https://flutter.dev/docs/cookbook/forms/validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _buildInput(), //caixa de entrada de texto
          _buildForgetButton(),
          _buildButtons() //botoes de login e sign in
        ],
      ),
    );
  }
  Widget _buildForgetButton()
  {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
      margin: EdgeInsets.only(top:5, right:10),
      child: FlatButton(
        onPressed: (){
          //vai para pagina
        },
        color: Colors.transparent,
        textColor: Colors.white,
        child:
        Text("Forgot Password") )
      )
    );
  }
  Widget _buildInput()
  {
    return new Container( 
      //padding se reajusta para que o teclado nao fique
      //sobre a caixa de texto
      padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
      child: 
        SizedBox(
        width: 345,
        height: 180,
        //widget personalizado
        //(ver:apostolicare/widgets/whiteContainer.dart )
        child: WhiteContainers( 
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 290,
              child:
                //ENTRADA LOGIN
                TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: "E-mail adress"
                ),
                //alterar esse metodo para validar email
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Incorrect e-mail adress';
                  }
                  return null;
                },
              )
            ),
            Container(
              width: 290,            
              child: 
              //ENTRADA SENHA
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  hintText: "Password"
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

  Widget _buildButtons()
  {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
      width: 350,
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //BOTAO LOGIN
          MainButton(
              onPressed: () {
                //tenta validar as entradas de texto
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Login',
                          style: TextStyle(fontFamily: 'RobotoMono', 
                                  fontWeight: FontWeight.bold, fontSize: 19,
                                  color: Colors.white),),
          ),
          //BOTAO SIGN IN
          SecundaryButton(
              onPressed: () {
                //vai para tela de novo usuario
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Questions1()));
                // Navigator.push(context,
                //   MaterialPageRoute(builder: (context) => RegisterProfile()));
              },
              child: Text('Sign in',
                          style: TextStyle(fontFamily: 'RobotoMono', 
                                  fontWeight: FontWeight.bold, fontSize: 18,
                                  color: Colors.grey[700]),),
          )
        ])
      )
    );
  }
}