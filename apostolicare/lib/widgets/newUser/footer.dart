import 'package:flutter/material.dart';

//Indice de baixo da pagina
class FooterIndex extends StatelessWidget
{
  //quantPages = quantidade total de paginas
  //page = pagina atual
  final int quantPages;
  final int page;
  
  FooterIndex({@required this.page, @required this.quantPages});

  //implementa utilizando uma Listview
  //vai adicionando container circulares com a borda preta (bolinha vazia)
  //mas na da pagina selecionada printa o conteudo de preto
  Widget build(BuildContext context)
  {
    //calcula a largura com base na quantidade total de paginas
    double largura = 12*quantPages.toDouble();
    return Container(
      child: SizedBox(
        height: 15,
        width: largura,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: quantPages,
          itemBuilder: (BuildContext context, int index){
            return SizedBox(
                  height:5,
                  child:
                  Container(
                  margin: EdgeInsets.symmetric(horizontal: 1),
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      //se for a da pagina pinta de preto
                      color: index == page? Colors.black: Colors.transparent,
                      border: Border.all(width: 2, color: Colors.black),
                      shape: BoxShape.circle
                    ),
                  )
                  );
          }),),
    );
  }
}