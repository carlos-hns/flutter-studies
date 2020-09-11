class CalculosViagem {
  static double calcularDeltaKM(String kmInicial, String kmFinal){
    double inicialKmI = double.parse(kmInicial);
    double finalKmI = double.parse(kmFinal);
    return finalKmI - inicialKmI;
  }

  static double calcularDeltaGasolina(String gasolinaInicial, String gasolinaFinal){
    double gasolinaInicialI = double.parse(gasolinaInicial);
    double gasolinaFinalI = double.parse(gasolinaFinal);
    return gasolinaFinalI - gasolinaInicialI;
  }

  static double calcularMediaCombustivel(String kmInicial, String kmFinal, String gasolinaInicial, String gasolinaFinal){
    return calcularDeltaKM(kmInicial, kmFinal) / calcularDeltaGasolina(gasolinaInicial, gasolinaFinal);
  }

  static double calcularKMRodadosHoje(List lista){
    
    String day = DateTime.now().day.toString();
    String month = DateTime.now().month.toString();
    String year = DateTime.now().year.toString();
    
    double kmTotal = 0;

    for (var item in lista){
      String data = item['data'];
      String newDay = data.split("/")[0];
      String newMonth = data.split("/")[1];
      String newYear = data.split("/")[2];

      if(day == newDay && month == newMonth && year == newYear){
        kmTotal += calcularDeltaKM(item['kmInicial'], item['kmFinal']);
      }
    }
    return kmTotal;
  }

  static Future<List> getDailyData(List lista){

    List _newListData = [];

    String day = DateTime.now().day.toString();
    String month = DateTime.now().month.toString();
    String year = DateTime.now().year.toString();

    for (var item in lista){
      String data = item['data'];
      String newDay = data.split("/")[0];
      String newMonth = data.split("/")[1];
      String newYear = data.split("/")[2];

      if(day == newDay && month == newMonth && year == newYear){
        _newListData.add(item);
      }
    }
    return Future.delayed(Duration(microseconds: 1), () => _newListData);
  }

  static Future<List> getWithData(List lista, DateTime data){

    List _newListData = [];

    var newdata = data.toString().split(" ")[0].toString().split('-');
    double day = double.parse(newdata[2]);
    double month = double.parse(newdata[1]);
    double year = double.parse(newdata[0]);

    for (var item in lista){
      String data = item['data'];
      double newDay = double.parse(data.split("/")[0]);
      double newMonth = double.parse(data.split("/")[1]);
      double newYear = double.parse(data.split("/")[2]);

      if(day == newDay && month == newMonth && year == newYear){
        _newListData.add(item);
      }
    }
    return Future.delayed(Duration(microseconds: 1), () => _newListData);
  }

  static Future<Map> getDailyStatistic(List lista, DateTime data){

    Map<String, dynamic> map = Map();
    map['kmRodados'] = 0.0;
    map['gasolinaAbastecida'] = 0.0;
    map['media'] = 0.0;

    var newdata = data.toString().split(" ")[0].toString().split('-');
    double day = double.parse(newdata[2]);
    double month = double.parse(newdata[1]);
    double year = double.parse(newdata[0]);

    for (var item in lista){
      String data = item['data'];
      double newDay = double.parse(data.split("/")[0]);
      double newMonth = double.parse(data.split("/")[1]);
      double newYear = double.parse(data.split("/")[2]);

      if(day == newDay && month == newMonth && year == newYear){
        map['kmRodados'] += CalculosViagem.calcularDeltaKM(item['kmInicial'], item['kmFinal']);
        map['gasolinaAbastecida'] += CalculosViagem.calcularDeltaGasolina(item['gasolinaInicial'], item['gasolinaFinal']);
        double media = map['kmRodados'] / map['gasolinaAbastecida'];
        if (media == 0.0 || media == null || media == double.infinity){
          map['media'] = 0.0;
        }  else {
          map['media'] = media;
        }
      
      }
    }
    return Future.delayed(Duration(microseconds: 1), () => map);
  }



}