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
      top: 400,
      child: Center(
      child: WhiteContainers(
        child: Center(child:
          Text("TEXTO")
          ),
        )
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
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}