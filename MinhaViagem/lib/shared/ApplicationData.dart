import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ApplicationData {

  List listViagens = [];

  void saveMap(Map map){
    listViagens.add(map);
  }

  void removeMap(int index){
    listViagens.removeAt(index);
  }

  Future<File> getFile() async{
    Directory directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> saveData() async {
    File file = await getFile();
    return file.writeAsString(json.encode(listViagens));
  }

  Future<String> readData() async {
    try {
      File file = await getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }

  String uid;
  static final ApplicationData _singleton = ApplicationData._internal();

  factory ApplicationData(){
    return _singleton;
  }

  ApplicationData._internal();  
} 