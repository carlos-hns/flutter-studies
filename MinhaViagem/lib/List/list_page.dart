import 'package:MinhaViagem/List/widget/customlisttile_widget.dart';
import 'package:MinhaViagem/shared/ApplicationData.dart';
import 'package:MinhaViagem/shared/calculosViagem.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List _listData = [];

  Map infoDiaria = Map();

  Future<List> run() async {
    return await CalculosViagem.getDailyData(ApplicationData().listViagens);
  }

  Future<Map> runMap() async {
    return await CalculosViagem.getDailyStatistic(ApplicationData().listViagens, DateTime.now());
  }

  @override
  void initState() {
    super.initState();

    infoDiaria['kmRodados'] = 0.0;
    infoDiaria['gasolinaAbastecida'] = 0.0;
    infoDiaria['media'] = 0.0;

    run().then((lista) {
      _listData = lista;
    });

    runMap().then((map) {
      setState(() {
        infoDiaria = map;  
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.brown,
            height: 250.0,
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
                  height: 120.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.brown,
                        ),
                        onPressed: () async {
                          final data = await showDatePicker(
                            locale: Locale('pt'),
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030),
                          );

                          if (data != null) {
                            Map map = await CalculosViagem.getDailyStatistic(
                                ApplicationData().listViagens, data);
                            List list = List.from(
                                await CalculosViagem.getWithData(
                                    ApplicationData().listViagens, data));
                            setState(() {
                              infoDiaria = map;
                              _listData = list;
                            });
                          }
                          print(infoDiaria);
                        },
                      ),
                      Text("Km Rodados: ${infoDiaria['kmRodados'].toStringAsFixed(1)}"),
                      Text(
                          "Gasolina Usada: ${infoDiaria['gasolinaAbastecida'].toStringAsFixed(1)}"),
                      Text("Média: ${infoDiaria['media'].toStringAsFixed(1)}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
              child: FutureBuilder(
                future: Future.delayed(Duration(seconds: 1), () => _listData),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.brown),
                          strokeWidth: 2.0,
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Erro ao Carregar os Dados!",
                            style: TextStyle(color: Colors.brown),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: _listData.length,
                          itemBuilder: (context, index) {
                            return customListTile(
                                context, _listData[index], index);
                          },
                        );
                      }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
