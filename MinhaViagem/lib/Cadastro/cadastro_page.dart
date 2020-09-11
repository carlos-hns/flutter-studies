import 'dart:convert';

import 'package:MinhaViagem/shared/calculosViagem.dart';
import 'package:flutter/material.dart';
import 'package:MinhaViagem/Cadastro/widget/customTextField_widget.dart';

import 'package:MinhaViagem/shared/ApplicationData.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {

  TextEditingController kmInicialController = TextEditingController();
  TextEditingController kmFinalController = TextEditingController();
  TextEditingController gasolinaInicialController = TextEditingController();
  TextEditingController gasolinaFinalController = TextEditingController();

  String _totalKmHJ = "0";

  @override
  void initState() {
    super.initState();

    ApplicationData().readData().then((data) {
      ApplicationData().listViagens = json.decode(data);
      setState(() {
        _totalKmHJ = CalculosViagem.calcularKMRodadosHoje(ApplicationData().listViagens).toString();
        print(_totalKmHJ);
      });
    });      
  }

  void _addViagem(){

    String kmInicial = kmInicialController.text;
    String kmFinal = kmFinalController.text;
    String gasolinaInicial = gasolinaInicialController.text;
    String gasolinaFinal = gasolinaFinalController.text;


    if (kmInicial.isNotEmpty && kmFinal.isNotEmpty && gasolinaInicial.isNotEmpty && gasolinaFinal.isNotEmpty){
      Map<String, dynamic> viagem = Map();
      viagem['kmInicial'] = kmInicial;
      viagem['kmFinal'] = kmFinal;
      viagem['gasolinaInicial'] = gasolinaInicial;
      viagem['gasolinaFinal'] = gasolinaFinal;

      String day = DateTime.now().day.toString();
      String month = DateTime.now().month.toString();
      String year = DateTime.now().year.toString();
      viagem['data'] = "$day/$month/$year";

      ApplicationData().saveMap(viagem);
      ApplicationData().saveData();

      kmInicialController.text = "";
      kmFinalController.text = "";
      gasolinaInicialController.text = "";
      gasolinaFinalController.text = "";


      final snackbar = SnackBar(
        duration: Duration(seconds: 1),
        content: Text("Cadastro Realizado com Sucesso"),
      );

      Scaffold.of(context).showSnackBar(snackbar);

      setState(() {
        _totalKmHJ = CalculosViagem.calcularKMRodadosHoje(ApplicationData().listViagens).toString();
      });
      
    } else {

      final snackbar = SnackBar(
        duration: Duration(seconds: 1),
        content: Text("Campo(s) não preenchido(s)."),
      );

      Scaffold.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.brown,
            height: 180.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Minha Viagem",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 220.0,
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    "KM Hoje: $_totalKmHJ",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 50.0),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    customTextField("Km Inicial", kmInicialController),
                    customTextField("Km Final", kmFinalController),
                    customTextField("Gasolina Inicial", gasolinaInicialController),
                    customTextField("Gasolina Final", gasolinaFinalController),
                    SizedBox(
                      height: 15.0,
                    ),
                    RaisedButton(
                      child: Container(
                        child: Text(
                          "Realizar Anotação",
                          style: TextStyle(color: Colors.white),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        alignment: Alignment.center,
                      ),
                      onPressed: _addViagem,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
