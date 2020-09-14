import 'package:AlcoolouGasolina7192/widgets/input_widget.dart';
import 'package:AlcoolouGasolina7192/widgets/loading_button_widget.dart';
import 'package:flutter/material.dart';

class SubmitForm extends StatelessWidget {
  var gasolinaController;
  var alcoolController;
  var busy = false;
  Function submitFunction;

  SubmitForm({
    @required this.gasolinaController,
    @required this.alcoolController,
    @required this.busy,
    @required this.submitFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Input(
          controller: alcoolController,
          label: "Alcool",
        ),
        Input(
          controller: gasolinaController,
          label: "Gasolina",
        ),
        LoadingButton(
          busy: busy,
          function: submitFunction,
          text: "Calcular",
          invert: false,
        ),
      ],
    );
  }
}
