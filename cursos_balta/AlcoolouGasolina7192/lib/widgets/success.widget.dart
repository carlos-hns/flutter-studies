import 'package:AlcoolouGasolina7192/widgets/loading_button_widget.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  var text = "";
  Function reset;

  Success({
    @required this.text,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: "BigShoulders",
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          LoadingButton(
            busy: false,
            function: reset,
            text: "Calcular Novamente",
            invert: true,
          ),
        ],
      ),
    );
  }
}
