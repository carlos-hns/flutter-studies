import 'package:flutter/material.dart';

import 'Home/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Minha Viagem",
    home: HomePage(),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: [
      Locale('pt'),
    ],
  ));
}