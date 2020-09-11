import 'package:MinhaViagem/shared/calculosViagem.dart';
import 'package:flutter/material.dart';

Widget customListTile(context, Map item, int index) {
  return Container(
    padding: EdgeInsets.all(8.0),
    height: 100.0,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.brown,
    ),
    margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Viagem: ${index + 1}",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Km Inicial: ${item['kmInicial']}",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              "Km Final: ${item['kmFinal']}",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: 2.0,
        ),
        Text(
          "Km Rodados: ${CalculosViagem.calcularDeltaKM(item['kmInicial'], item['kmFinal'])}",
          style: TextStyle(color: Colors.lightGreen[100]),
        ),
      ],
    ),
  );
}

/*

        Text(
          "Média: ${CalculosViagem.calcularMediaCombustivel(item['kmInicial'], item['kmFinal'], item['gasolinaInicial'], item['gasolinaFinal'])}",
          style: TextStyle(color: Colors.lightGreen[100], fontSize: 15.0),
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Km Final: ${item['kmFinal']}",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 27.0,
            ),
            Text(
              "Gasolina Final: ${item['gasolinaFinal']}",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Km Rodados: ${CalculosViagem.calcularDeltaKM(item['kmInicial'], item['kmFinal'])}",
              style: TextStyle(color: Colors.lightGreen[100]),
            ),
            SizedBox(
              width: 28.0,
            ),
            Text(
              "Total de Combustível: ${CalculosViagem.calcularDeltaGasolina(item['gasolinaInicial'], item['gasolinaFinal'])}",
              style: TextStyle(color: Colors.lightGreen[100]),
            ),
          ],
        ),
*/
