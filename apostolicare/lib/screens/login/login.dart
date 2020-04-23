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
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  _buildImage(),//imagem do fundo
                  _buildActionArea(),//area onde tera as entradas e botoes
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

  Widget _buildActionArea()
  {
    return new Positioned(
      top: 360,
      child: Center(
      child: new LoginForm()
      )
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildInput(),
          _buildButtons()
        ],
      ),
    );
  }

  Widget _buildInput()
  {
  //   TextFormField(
  //   validator: (value) {
  //     if (value.isEmpty) {
  //       return 'Please enter some text';
  //     }
  //     return null;
  //   },
  // )
    return new SizedBox(
      width: 350,
      height: 180,
      child: WhiteContainers(
      child: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 290,
            child:
              TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.mail),
                hintText: "E-mail adress"
              ),
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
              TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.vpn_key),
                hintText: "Password"
              ),
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
    );
  }

  Widget _buildButtons()
  {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SizedBox(
      width: 350,
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MainButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Login',
                          style: TextStyle(fontFamily: 'RobotoMono', 
                                  fontWeight: FontWeight.bold, fontSize: 19,
                                  color: Colors.white),),
          ),
          SecundaryButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
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