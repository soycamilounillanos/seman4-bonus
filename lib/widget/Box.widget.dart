import 'package:bonus/style/Color.style.dart';
import 'package:flutter/material.dart';

class Box {
  static   getBoxButton({
    required GestureTapCallback action, 
    required String title, 
    required String image, 
    required Color color
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: action,
          child: Container(
            width: 200,
            height: 250,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20.0, color: colorSubText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static getBoxRange({
    required String title,
    required VoidCallback actionIncrement,
    required VoidCallback actionDecrease,
    required int value
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            color: colorBox,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20.0, color: colorSubText),
                ),
              ),
              Text(
                value.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                  color: colorText,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: actionDecrease,
                      backgroundColor: colorButtonCircle,
                      child: Image.asset("assets/menos.png"),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: actionIncrement,
                    backgroundColor: colorButtonCircle,
                    child: Image.asset("assets/mas.png"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}