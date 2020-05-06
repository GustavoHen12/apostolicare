import 'package:apostolicare/screens/newUser/register/register3.dart';
import 'package:apostolicare/social_icons_icons.dart';
import 'package:apostolicare/widgets/generalConfig.dart';
import 'package:apostolicare/widgets/newUser/progressBar2.dart';
import 'package:apostolicare/widgets/whiteContainer.dart';
import 'package:flutter/material.dart';
import 'package:apostolicare/widgets/title.dart';
import 'package:apostolicare/widgets/screenSize.dart';
import 'package:apostolicare/widgets/SecundaryButton.dart';
import 'package:international_phone_input/international_phone_input.dart';

class RegisterContact extends StatefulWidget
{
  @override
  _RegisterContactState createState() => _RegisterContactState();
}

class _RegisterContactState extends State<RegisterContact> {
  //VER: https://pub.dev/packages/international_phone_input#-readme-tab-
  String phoneNumber;
  String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';

  var _settings = new Rules();

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    print(number);
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  onValidPhoneNumber(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      visible = true;
      confirmedNumber = internationalizedPhoneNumber;
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: _settings.colorLight,
      body: new SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildText("Contact information", 19),
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
              _getPhone(),
              _getConfig(),
            ]
          )),),
    );
  }

  Widget _getConfig()
  {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText("Which of this services you use", 15),
          _buildOptions(),
        ]),
    );
  }

  String _whatsapp = "";
  String _telegram = "";
  String _email = "";
  String _phone = "";

  Widget _buildOptions()
  {
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal * 30,
      child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckboxListTile(
             title: Icon(SocialIcons.whatsapp, color: Colors.green,),
             value: _whatsapp == phoneNumber,
             controlAffinity: ListTileControlAffinity.leading,
             onChanged: (value) {
                setState(() {
                  _whatsapp = value ? phoneNumber : "";
                });
              },     
          ),
          CheckboxListTile(
             title: Icon(SocialIcons.telegram, color: Colors.blue,),
             value: _telegram == phoneNumber,
             controlAffinity: ListTileControlAffinity.leading,
             onChanged: (value) {
                setState(() {
                  _telegram = value ? phoneNumber : "";
                });
              },     
          ),
          CheckboxListTile(
             title: Icon(SocialIcons.mail, color: Colors.red, size: 25),
             value: _email == phoneNumber, //ALTERAR PARA PEGAR O EMAIL
             controlAffinity: ListTileControlAffinity.leading,
             onChanged: (value) {
                setState(() {
                  _email = value ? phoneNumber : "";
                });
              },     
          ),
          CheckboxListTile(
             title: Icon(Icons.call, color: Colors.black, size: 30,),
             value: _phone == phoneNumber,
             controlAffinity: ListTileControlAffinity.leading,
             onChanged: (value) {
                setState(() {
                  _phone = value ? phoneNumber : "";
                });
              },     
          )
        ]
      ),
    ));
  }

  Widget _getPhone()
  {
    return InternationalPhoneInput(
              onPhoneNumberChange: onPhoneNumberChange,
              initialPhoneNumber: phoneNumber,
              initialSelection: phoneIsoCode,
              enabledCountries: ['+55', '+1'],
              labelText: "Phone Number",
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

  Widget _buildButton()
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: SecundaryButton(
        onPressed: () {
          //PARA FAZER: validação
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterCommunit()));
        }, 
        child: Text("Next", style: _settings.txtStyle)),
    );
  }
}