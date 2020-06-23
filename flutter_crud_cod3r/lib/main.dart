import 'package:flutter/material.dart';
import 'package:flutter_crud_cod3r/provider/users.dart';
import 'package:flutter_crud_cod3r/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => UsersProvider(),
      child: MaterialApp(
        title: "Flutter Crud",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: UserList(),
      ),
    ),
  );
}
