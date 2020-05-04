import 'package:apostolicare/widgets/screenSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//Barra de progresso exibida sobre a pagina de questionario
//implemtenta utilizando uma stack e o AnimatedPositioned para fazer a animacao
class ProgressBar extends StatefulWidget
{
  //position = numero da pagina
  //utiliza para calcular nova posicao
  final double position;
  ProgressBar({@required this.position});

  @override 
  ProgressBarState createState() => ProgressBarState();
}
class ProgressBarState extends State<ProgressBar>
{
  Widget build(BuildContext context)
  {
    SizeConfig().init(context);
    double _inicialPosition = 10*SizeConfig.blockSizeHorizontal;
    return Container( 
    padding: EdgeInsets.only(top: 20),
    child: SizedBox(
      width: double.infinity,
      height: 12,
      child: Stack(
        children: <Widget>[
          //BARRA
          Positioned(
            top: 5,
            //Expanded
            child: SizedBox(
              height: 2,
              //calcula a largura com base no tamanho da tela (ver screenSize.dart)
              width: SizeConfig.blockSizeHorizontal * 100,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.black ),
            )
            ),
          //BOLINHA
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: 0,
            //calcula a nova posicao somando a posicao inicial
            left: _inicialPosition + (widget.position*10*SizeConfig.blockSizeHorizontal),
            //a bolinha eh apenas um container circular preto
            child: Container(
              padding: EdgeInsets.all(5.5),
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.black)
            )
          ),
        ],
      ),
    )
    );

  }
}