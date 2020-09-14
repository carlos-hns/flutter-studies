import 'package:AlcoolouGasolina7192/widgets/logo_widget.dart';
import 'package:AlcoolouGasolina7192/widgets/submit_form.dart';
import 'package:AlcoolouGasolina7192/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasolinaController = new MoneyMaskedTextController();
  var _alcoolController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";
  Color _color = Colors.deepPurple;

  Future calculate() {
    double alc =
        double.parse(_alcoolController.text.replaceAll(RegExp(r'[,.]'), "")) /
            100;
    double gas =
        double.parse(_gasolinaController.text.replaceAll(RegExp(r'[,.]'), "")) /
            100;
    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina!";
        } else {
          _resultText = "Compensa utilizar Álcool!";
        }

        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _gasolinaController = MoneyMaskedTextController();
      _alcoolController = MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 1200),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? Success(
                    text: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    alcoolController: _alcoolController,
                    gasolinaController: _gasolinaController,
                    submitFunction: calculate,
                    busy: _busy,
                  ),
          ],
        ),
      ),
    );
  }
}
