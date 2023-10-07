import 'package:flutter/material.dart';
import 'package:flutter_calculator/models/character_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  String expressionString = '';
  var result;
  List<int> numbers = [];
  List<String> operators = [];

  void _getExpression(String value) {
    setState(() {
      expressionString += value;
    });
  }

  void _evaluateExpression() {
    numbers = expressionString
        .split(RegExp(r'[+-/*]'))
        .map((string) => int.parse(string.trim()))
        .toList();
    operators = expressionString
        .split(RegExp(r'\d+(\.\d+)?'))
        .where((string) => string.isNotEmpty)
        .toList();

    result = numbers[0];
    for (int i = 0; i < numbers.length - 1; i++) {
      switch (operators[i]) {
        case '+':
          result += numbers[i + 1];
          break;

        case '-':
          result += numbers[i + 1];
          break;

        case '*':
          result *= numbers[i + 1];
          break;

        case '/':
          result /= numbers[i + 1];
          break;
      }
    }

    setState(() {
      expressionString = result.toString();
    });
  }

  void _eraseExpression() {
    expressionString = '';
    setState(() {
      expressionString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Center(child: Text(expressionString)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          _eraseExpression();
                        },
                        child: Text('C'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('label'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('label'),
                      ),
                      TextButton(
                        onPressed: () {
                          _getExpression('/');
                        },
                        child: Text('/'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(
                        3,
                        (index) => CharacterButton(
                          action: () {
                            _getExpression('${index + 7}');
                          },
                          text: Text('${index + 7}'),
                        ),
                      ),
                      CharacterButton(
                        action: () {
                          _getExpression('*');
                        },
                        text: Text('*'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(
                        3,
                        (index) => CharacterButton(
                          action: () {
                            _getExpression('${index + 4}');
                          },
                          text: Text('${index + 4}'),
                        ),
                      ),
                      CharacterButton(
                        action: () {
                          _getExpression('-');
                        },
                        text: Text('-'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(
                        3,
                        (index) => CharacterButton(
                          action: () {
                            _getExpression('${index + 1}');
                          },
                          text: Text('${index + 1}'),
                        ),
                      ),
                      CharacterButton(
                        action: () {
                          _getExpression('+');
                        },
                        text: Text('+'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('label'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('0'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('label'),
                      ),
                      TextButton(
                        onPressed: () {
                          _evaluateExpression();
                        },
                        child: Text('='),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
