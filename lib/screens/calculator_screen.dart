import 'package:flutter/material.dart';
import 'package:flutter_calculator/models/character_button.dart';
import 'package:flutter_calculator/theme/colors.dart';
import 'package:flutter_calculator/data/character_list.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
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
        .split(RegExp(r'[+-/*%]'))
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
    if (expressionString.isNotEmpty) {
      setState(() {
        expressionString = '';
      });
    }
  }

  void _removeLast() {
    if (expressionString.isNotEmpty) {
      setState(() {
        expressionString =
            expressionString.substring(0, expressionString.length - 1);
      });
    }
  }

  void _calculatePercentage() {
    if (expressionString.isNotEmpty) {
      double expressionDivider = 1;
      for (int i = 0; i < expressionString.length; i++) {
        expressionDivider *= 10;
      }
      setState(() {
        expressionString =
            (double.parse(expressionString) / expressionDivider).toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: (expressionString.isEmpty)
                  ? Text('0')
                  : Text(expressionString),
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CharacterButton(
                      action: () => _eraseExpression(),
                      color: operationColor,
                      text: (expressionString.isEmpty) ? Text('C') : Text('AC'),
                    ),
                    CharacterButton(
                      action: () => _removeLast(),
                      color: operationColor,
                      text: Text('\u232B'),
                    ),
                    CharacterButton(
                      action: () => _calculatePercentage(),
                      color: operationColor,
                      text: Text('%'),
                    ),
                    CharacterButton(
                      action: () => _getExpression('/'),
                      color: operationColor,
                      text: Text('\u00F7'),
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
                        color: numbersColor,
                      ),
                    ),
                    CharacterButton(
                      action: () {
                        _getExpression('*');
                      },
                      color: operationColor,
                      text: Text('\u0078'),
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
                        color: numbersColor,
                      ),
                    ),
                    CharacterButton(
                      action: () {
                        _getExpression('-');
                      },
                      color: operationColor,
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
                        color: numbersColor,
                      ),
                    ),
                    CharacterButton(
                      action: () {
                        _getExpression('+');
                      },
                      color: operationColor,
                      text: Text('+'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CharacterButton(
                      action: () {},
                      color: operationColor,
                      text: Text('\u21BB'),
                    ),
                    CharacterButton(
                      action: () {},
                      color: numbersColor,
                      text: Text('0'),
                    ),
                    CharacterButton(
                      action: () {},
                      color: numbersColor,
                      text: Text('.'),
                    ),
                    CharacterButton(
                      action: () {},
                      color: operationColor,
                      text: Text('='),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
