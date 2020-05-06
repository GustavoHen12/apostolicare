import 'package:apostolicare/widgets/generalConfig.dart';
import 'package:apostolicare/widgets/newUser/progressBar2.dart';
import 'package:flutter/material.dart';
import 'package:apostolicare/widgets/newUser/progressBar.dart';
import 'package:apostolicare/widgets/title.dart';

class RegisterContact extends StatelessWidget
{
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
        new ProgressBarReg(positionIni: 5, positionFim: 7)
      ]),
    );
  }
}