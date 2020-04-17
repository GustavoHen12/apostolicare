import 'package:apostolicare/social_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

class Messages extends StatefulWidget{
  @override
  var _img;
  var _name;
  var _text;
  var _contact;
  Messages(this._img, this._name, this._text, this._contact);
  MessagesStates createState() => MessagesStates(_img, _name, _text, _contact);
}

class MessagesStates extends State<Messages>{
  var _img;
  var _name;
  var _text;
  var _contact;
  MessagesStates(this._img, this._name, this._text, this._contact);
  BuildContext _context;
  
  

  List _info = new List();
  //constroi informacoes que serao disponiblizadas depois
  void loadInfo(){
    _info.clear();
    _info.add(_buildCard());
    _info.add(_buidContact(_contact));
  }
  

  //altera entre os dois estados de uma mensagem
  bool selected = true;

  @override 
  Widget build (BuildContext context) {
    this._context = context;
    loadInfo();
    return new GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: new AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      color: selected ? Color.fromARGB(255, 241, 238, 231) : Colors.white,
      margin: EdgeInsets.symmetric(vertical:15.0),//alterar valor
      height: selected ? 90.0 : 130.0, 
      child: 
        new  SizedBox(
        height: selected ? 90.0 : 120.0,
        width: double.infinity,
        child:
            ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: selected ? 1:2,
            itemBuilder: (context, index) {
              return _info[index];
            },
          )
        )
    )
    );
  }

  Widget _buildCard(){
    return SizedBox(
      width: double.infinity,
      height: 90.0,
      child:
      new Row(
        children:[
          _buildUserIcon(_img),
          new Column(
            children:[
              _buildName(_name),
              _buildText(_text)
          ])
        ])
      );
  }

  Widget _buildUserIcon(img){
    return Container(
      margin: EdgeInsets.only(right: 10.0, left: 25.0, top: 5),
      height: 80,
      width: 80,
      child:
        ClipRRect(
          borderRadius:  BorderRadius.circular(18.0),
          child: new AspectRatio(
          aspectRatio: 487 / 451,
          child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.cover,
                alignment: FractionalOffset.topCenter,
                image: new NetworkImage(img),
              )
            ),
          ),
        ),
      ),
    );    
  }

  Widget _buildName(name){
    return Container(
        width: 250,
        padding: EdgeInsets.all(5.0),
        child:Text(name,
              style: TextStyle( fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black),
              textAlign: TextAlign.left,
              overflow: TextOverflow.clip,
              ));
  }

  Widget _buildText(text){
    return Flexible(child:  
      Container(
      width: 250,
      padding: EdgeInsets.only(left: 5.0), 
      child:
        Text(text,
              style: TextStyle(fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.8),),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.left,
        )
    ),
    );
  }

  Widget _buidContact(contact)
  {
    
    return new ContactInfo(_contact['whatsapp'], _contact['telegram'], _contact['messenger'], _contact['gmail']);;
  } 
}

class ContactInfo extends StatelessWidget
{
  var whatsapp;
  var telegram;
  var messenger;
  var gmail;
  ContactInfo(this.whatsapp, this.telegram, this.messenger, this.gmail);
  BuildContext _context;
  
  List _contactList = new List();
  
  void loadContact(context)
  {
    _contactList.clear();
    if (whatsapp != "") _contactList.add(_buildWhatsapp(whatsapp, context));
    if (telegram != "") _contactList.add(_buildTelegram(telegram, context));
    if (messenger != "") _contactList.add(_buildMessenger(messenger, context));
    if (gmail != "") _contactList.add(_buildGmail(gmail, context));
  }

  @override
  Widget build (BuildContext context) {
    
    loadContact(context);
    print("*>*: ${_contactList.length}");
    return new Container(
      padding: EdgeInsets.only(top: 10),
      child: new SizedBox(
      width: 250,
      height: 20,
      child: new Center(
      child: new
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),  
          itemCount: _contactList.length,
          itemBuilder: (context, index) {
              return _contactList[index];
            })
          ) 
        )
    );
  }
  void _copiedMessage (context){
     showDialog(
                context: context,
                builder: (_)=> AlertDialog(
                  title: Text("Copied to Clipboard",
                              style: TextStyle(fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,)),
                  content: Text("Please save and let's talk!",
                              style: TextStyle(fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.white,)),
                  elevation: 24.0,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)),
                ));
  }
  Widget _buildWhatsapp(whatsapp, context)
  {
    return new GestureDetector(
          onTap: () {
              Clipboard.setData(ClipboardData(text: whatsapp));
              _copiedMessage(context);
          },
          child: Container(
          margin: EdgeInsets.only(right: 15),
          child:
            Icon(
            SocialIcons.whatsapp,
            size: 20,
            color: Colors.green,
            ),
          )
        );
  }

  Widget _buildTelegram(telegram, context)
  {
      return new GestureDetector(
          onTap: () {
              Clipboard.setData(ClipboardData(text: telegram));
              _copiedMessage(context);
          },
          child: Container(
          margin: EdgeInsets.only(right: 15),
          child:
            Icon(
            SocialIcons.telegram,
            size: 20,
            color: Colors.blue,
            ),
          )
        );
  }

  Widget _buildGmail(gmail, context)
  {
        return new GestureDetector(
          onTap: () {
              Clipboard.setData(ClipboardData(text: gmail));
              _copiedMessage(context);
          },
          child: Container(
          margin: EdgeInsets.only(right: 15),
          child:
            Icon(
            SocialIcons.google,
            size: 20,
            color: Colors.red,
            ),
          )
        );
  }

  Widget _buildMessenger(messenger, context)
  {
        return new GestureDetector(
          onTap: () {
              Clipboard.setData(ClipboardData(text: messenger));
              _copiedMessage(context);
          },
          child: Container(
          margin: EdgeInsets.only(right: 15),
          child:
            Icon(
            SocialIcons.messenger,
            size: 20,
            color: Colors.blue,
            ),
          )
        );
  }
}