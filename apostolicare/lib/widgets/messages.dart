import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Messages extends StatefulWidget{
  @override
  var _img;
  var _name;
  var _text;
  Messages(this._img, this._name, this._text);
  MessagesStates createState() => MessagesStates(_img, _name, _text);
}

class MessagesStates extends State<Messages>{
  var _img;
  var _name;
  var _text;

  MessagesStates(this._img, this._name, this._text);
  BuildContext _context;
  
  

  List _info = new List();
  //constroi informacoes que serao disponiblizadas depois
  void loadInfo()
  {
    //_info.add(_buildText(_name));
    _info.add(_buildText(_text));
    _info.add(_buidContact());
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
      height: selected ? 85.0 : 130.0, 
      child: new Row(
        children:[
          _buildUserIcon(_img),
          new Container(
          width: 250,
          child:
          Column(
            children:[
            new Container(
              child:
              _buildName(_name)),
            new Container(
              child:
              new Flexible(
                child: SizedBox(
                height: double.infinity,
                child: ListView.builder(
                    itemCount: selected ? 1:2,
                    itemBuilder: (context, index) {
                      return _info[index];
                    },
                  )
                )
              )
            )
          ])
          )
        ])
      )
    );
  }

  Widget _buildUserIcon(img)
  {
    return Container(
      margin: EdgeInsets.only(right: 10.0, left: 25.0),
      height: 80,
      width: 80,
      child: //eh para preencher todo o container ,
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

  Widget _buildName(name)
  {
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

  Widget _buildText(text)
  {
    return Container(
      //width: 250,
      padding: EdgeInsets.all(5.0), 
      margin: EdgeInsets.only(top: 3),
      child:
        Text(text,
              style: TextStyle(fontFamily: 'RobotoMono',
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black.withOpacity(0.8),),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.left,
        )
    );
  }

  Widget _buidContact()
  {
    return new Container(
      height: 20,
      child: new Text('CONTATOS', 
      style: TextStyle(fontFamily: 'RobotoMono',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.8),),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
      ),
    );
  }
}

// return Container(
//       width: 250,
//       padding: EdgeInsets.all(5.0),
//       child: new Column( 
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Text(name,
//               style: TextStyle( fontFamily: 'RobotoMono',
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 17,
//                                 color: Colors.black),
//               textAlign: TextAlign.left,
//               overflow: TextOverflow.clip,
//               ),
//           Expanded(
//             child:
//             Container( 
//             margin: EdgeInsets.only(top: 3),
//             child:
//               Text(text,
//                     style: TextStyle(fontFamily: 'RobotoMono',
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 15,
//                                     color: Colors.black.withOpacity(0.8),),
//                     overflow: TextOverflow.clip,
//                     textAlign: TextAlign.left,
//               ),
//             )
//           )
//         ],
//       ),
//     );