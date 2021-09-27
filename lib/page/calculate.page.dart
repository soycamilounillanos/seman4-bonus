import 'dart:math';

import 'package:bonus/model/Person.model.dart';
import 'package:flutter/material.dart';

import '../style/Color.style.dart';

class Calculate extends StatelessWidget {
  final Person person;
  String state = "bajo";
  double imc = 0;
  Color? colorRange = Colors.orange[200];
  
  Calculate({required this.person});

  @override
  Widget build(BuildContext context) {
    calculateIMC();

    return _body(context);
  }

  _body(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ),
      body: Container(
        color: backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                  child: Text(
                    "Resultado",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 70.0,
                      color: colorText,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: colorBox,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  state.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: colorRange,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  imc.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 170.0,
                                    color: colorText,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Container(
                                  child: Text(
                                    "Tiene un peso corporal $state.",
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: colorText,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  calculateIMC() {
    double height = person.height / 100;
    imc = person.weigh / pow(height, 1);

    if (imc > 18.5) {
      if (imc <= 24.9) {
        state = "normal";
        colorRange = Colors.green;
      } else if (imc <= 29) {
        state = "en sobrepeso";
        colorRange = Colors.orange;
      } else if (imc <= 34.5) {
        state = "en obesidad grado I";
        colorRange = Colors.red[600];
      } else if (imc <= 39.9) {
        state = "en obesidad grado II";
        colorRange = Colors.red[700];
      } else {
        state = "en obesidad grado III";
        colorRange = Colors.red[900];
      }
    }
  }
}
