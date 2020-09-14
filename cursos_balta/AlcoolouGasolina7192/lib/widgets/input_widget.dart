import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  var label = "";
  var controller;

  Input({@required this.label, @required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 130,
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontFamily: "BigShoulders"),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontFamily: "BigShoulders",
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
