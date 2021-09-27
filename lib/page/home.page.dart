import 'dart:ui';

import 'package:bonus/enum/Gender.enum.dart';
import 'package:bonus/model/Person.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../style/Color.style.dart';
import '../widget/Box.widget.dart';
import 'calculate.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var imageMale = "assets/masculino.png";
  var imageFemale = "assets/femenino.png";

  final Person person =
      Person(gender: Gender.male, weigh: 62, height: 166.0, age: 38);

  final maxHeight = 300.0;
  final maxAge = 120;
  final maxWeigh = 200;

  Color maleColor = colorBox;
  Color femaleColor = colorBox;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora IMC"),
        ),
        body: Container(
          color: backgroundColor,
          child: Column(
            children: [
              getPanelGender(),
              getPanelHeight(),
              getPanelRange(),
              getPanelCalculate()
            ],
          ),
        ));
  }

  getPanelRange() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Box.getBoxRange(
              title: "Peso",
              actionIncrement: getActionIncrementWeigh,
              actionDecrease: getActionDecreaseWeigh,
              value: person.weigh),
          Box.getBoxRange(
              title: "Edad",
              actionIncrement: getActionIncrementAge,
              actionDecrease: getActionDecreaseAge,
              value: person.age),
        ],
      ),
    );
  }

  getActionIncrementWeigh() {
    person.weigh += 1;

    setState(() {
      person.weigh = (person.weigh > maxWeigh) ? maxAge : person.weigh;
    });
  }

  getActionDecreaseWeigh() {
    person.weigh -= 1;

    setState(() {
      person.weigh = (person.weigh < 0) ? 0 : person.weigh;
    });
  }

  getActionIncrementAge() {
    person.age += 1;
    setState(() {
      person.age = (person.age > maxAge) ? maxAge : person.age;
    });
  }

  getActionDecreaseAge() {
    person.age -= 1;
    setState(() {
      person.age = (person.age < 0) ? 0 : person.age;
    });
  }

  getPanelGender() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Box.getBoxButton(
              action: getActionButtonMale,
              title: "Hombre",
              image: imageMale,
              color: maleColor),
          Box.getBoxButton(
              action: getActionButtonFemale,
              title: "Mujer",
              image: imageFemale,
              color: femaleColor),
        ],
      ),
    );
  }

  getActionButtonMale() {
    return setState(() {
      person.weigh = 62;
      person.age = 38;
      person.height = 170;
      femaleColor = colorBox;
      maleColor = colorBoxSelected;
    });
  }

  getActionButtonFemale() {
    setState(() {
      person.weigh = 62;
      person.age = 38;
      person.height = 150;
      femaleColor = colorBoxSelected;
      maleColor = colorBox;
    });
  }

  getPanelHeight() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorBox,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  Text(
                    "Estatura",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: colorSubText,
                    ),
                  ),
                  Row(children: [
                    Text(
                      person.height.round().toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60.0,
                        color: colorText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                      child: Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: colorSubText,
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ]),
            Row(children: [
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    thumbColor: primaryColor,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  ),
                  child: Slider(
                    value: person.height,
                    min: 1,
                    max: maxHeight,
                    divisions: maxHeight.toInt(),
                    label: person.height.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        person.height = value;
                      });
                    },
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }

  getPanelCalculate() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
              ),
              onPressed: calculateIMC,
              child: Text(
                "Calcular",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
        ),
      ],
    );
  }

  calculateIMC() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Calculate(
          person: person
        ),
      ),
    );
  }
}
