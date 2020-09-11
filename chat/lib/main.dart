import 'package:chat/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Chat",
    debugShowCheckedModeBanner: false,
    home: ChatScreen(),
    theme: ThemeData(
      iconTheme: IconThemeData(
        color: Colors.blue,
      ),
    ),
  ));
}
