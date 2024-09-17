import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'component/buttons_field.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  String userQuestion = "";
  String userAnswer = "";

  void addCharacter(String char) {
    setState(() {
      userQuestion += char;
    });
  }

  void equalPressed() {
    setState(() {
      String finalQuestion = userQuestion.replaceAll('x', '*');
      Parser p = Parser();
      try {
        Expression exp = p.parse(finalQuestion);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        userAnswer = eval.toString();
      } catch (e) {
        userAnswer = "Error";
      }
    });
  }

  void clearUserQuestion() {
    setState(() {
      userQuestion = "";
      userAnswer = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.deepOrange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      userAnswer,
                      style: const TextStyle(
                          fontSize: 38,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userQuestion,
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtonsField(
            flex: 2,
            onCharacterPressed: addCharacter,
            onClear: clearUserQuestion,
            onEqualPressed: equalPressed,
          ),
        ],
      ),
    );
  }
}
