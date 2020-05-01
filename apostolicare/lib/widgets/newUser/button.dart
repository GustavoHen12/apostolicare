import 'package:flutter/material.dart';
import 'package:apostolicare/widgets/generalConfig.dart';


//ver : https://stackoverflow.com/questions/50060276/flutter-custom-radio-button
class ButtonModel
{
  final String text;
  bool active;
  ButtonModel(this.text, this.active);
}


class QuestionButton extends StatefulWidget
{
  // final String text;
  // final GestureTapCallback onPressed;
  // final String id;
  // final String buttonGroup;
  // QuestionButton({@required this.text, @required this.onPressed, @required this.id, @required this.buttonGroup});
  final ButtonModel item;
  QuestionButton(this.item);

  @override
  _QuestionButtonState createState() => _QuestionButtonState();
}

class _QuestionButtonState extends State<QuestionButton> {
  var _settings = new Rules();
  Widget build(BuildContext context)
  {
    var active = widget.item.active;

    return SizedBox(
      height: 40,
      width: double.infinity,
        child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        decoration: BoxDecoration(
                    color: active ? _settings.colorMiddleRed: Colors.white,
                    boxShadow: [BoxShadow(
                      color: active? Colors.grey[900]:Colors.transparent,
                      blurRadius: 6, 
                      spreadRadius: .5, 
                      offset: Offset(3, 3))],
                  ), 
        child: Center(child:Text(widget.item.text,
                    style: TextStyle(fontFamily: 'RobotoMono', 
                      fontWeight: FontWeight.bold, 
                      fontSize: 19,
                      color: active ? Colors.white: Colors.black
                    ),)) 
        )
    );
  }
  // Widget build(BuildContext context)
  // {
  //   var active = widget.id == widget.buttonGroup;
  //   if(active)
  //     print('object ${widget.id} ${widget.buttonGroup}');
  //   else
  //     print("nao ${widget.id} ${widget.buttonGroup}");
  //   return SizedBox(
  //     height: 40,
  //     width: double.infinity,
  //     child: GestureDetector(
  //       onTap: widget.onPressed,
  //       child: AnimatedContainer(
  //       duration: Duration(milliseconds: 500),
  //       curve: Curves.easeOutQuint,
  //       decoration: BoxDecoration(
  //                   color: active ? _settings.colorMiddleRed: Colors.white,
  //                   boxShadow: [BoxShadow(
  //                     color: active? Colors.grey[900]:Colors.transparent,
  //                     blurRadius: 6, 
  //                     spreadRadius: .5, 
  //                     offset: Offset(3, 3))],
  //                 ), 
  //       child: Center(child:Text("BOTAO",
  //                   style: TextStyle(fontFamily: 'RobotoMono', 
  //                     fontWeight: FontWeight.bold, 
  //                     fontSize: 19,
  //                     color: active ? Colors.white: Colors.black
  //                   ),)) 
  //       )
  //     )
  //   );
  // }
}

