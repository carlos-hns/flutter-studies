import 'package:flutter/material.dart';

Widget customTextField(String hintText, TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.only(top: 2.0),
    child: TextField(
      controller: controller,
      style: TextStyle(
        color: Colors.white,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.brown,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}
