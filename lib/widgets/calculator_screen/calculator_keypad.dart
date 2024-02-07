import 'package:flutter/material.dart';
import 'package:flutter_calculator/screens/calculator_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calculator/data/character_list.dart';
import 'package:flutter_calculator/models/calculator_model.dart';
import 'package:flutter_calculator/widgets/calculator_screen/buttons/digit_button.dart';
import 'package:flutter_calculator/widgets/calculator_screen/buttons/operator_button.dart';
import 'package:flutter_calculator/widgets/calculator_screen/buttons/expanded_button.dart';

class CalculatorKeypad extends StatefulWidget {
  CalculatorKeypad({super.key, required this.updateFlexCallback});

  final Function() updateFlexCallback;

  @override
  State<CalculatorKeypad> createState() => _CalculatorKeypadState();
}

class _CalculatorKeypadState extends State<CalculatorKeypad> {
  bool isExpanded = false;

  void toggleKeyboard() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    var numbers = CharacterList();
    var model = Provider.of<CalculatorModel>(context, listen: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isExpanded) ...[
          Row(
            children: [
              ExtendedButton(action: () {}, text: numbers.expanded[0]),
              ExtendedButton(action: () {}, text: numbers.expanded[1]),
              ExtendedButton(action: () {}, text: numbers.expanded[2]),
              ExtendedButton(action: () {}, text: numbers.expanded[3]),
              ExtendedButton(action: () {}, text: numbers.expanded[4]),
            ],
          ),
          Row(
            children: [
              ExtendedButton(action: () {}, text: numbers.expanded[5]),
              ExtendedButton(action: () {}, text: numbers.expanded[6]),
              ExtendedButton(action: () {}, text: numbers.expanded[7]),
              ExtendedButton(
                  action: () => model.checkInput('('),
                  text: numbers.expanded[8]),
              ExtendedButton(
                  action: () => model.checkInput(')'),
                  text: numbers.expanded[9]),
            ],
          ),
        ],
        Row(
          children: [
            if (isExpanded) ...[
              ExtendedButton(
                action: () => model.checkInput('√'),
                text: numbers.expanded[10],
              ),
            ],
            OperatorButton(
              action: () {
                model.eraseExpression();
              },
              text: numbers.numbers[0],
            ),
            OperatorButton(
              action: () {
                model.removeLastChar();
              },
              text: numbers.numbers[1],
            ),
            OperatorButton(
              action: () {
                model.checkInput(numbers.numbers[2]);
              },
              text: numbers.numbers[2],
            ),
            OperatorButton(
              action: () {
                model.checkInput('/');
              },
              text: numbers.numbers[3],
            ),
          ],
        ),
        Row(
          children: [
            if (isExpanded) ...[
              ExtendedButton(
                action: () {},
                text: numbers.expanded[11],
              ),
            ],
            DigitButton(
              action: () {
                model.checkInput(numbers.numbers[4]);
              },
              text: numbers.numbers[4],
            ),
            DigitButton(
              action: () {
                model.checkInput(numbers.numbers[5]);
              },
              text: numbers.numbers[5],
            ),
            DigitButton(
              action: () {
                model.checkInput(numbers.numbers[6]);
              },
              text: numbers.numbers[6],
            ),
            OperatorButton(
              action: () {
                model.checkInput('*');
              },
              text: numbers.numbers[7],
            ),
          ],
        ),
        Row(
          children: [
            if (isExpanded) ...[
              ExtendedButton(
                action: () {},
                text: numbers.expanded[12],
              ),
            ],
            DigitButton(
              action: () {
                model.checkInput(numbers.numbers[8]);
              },
              text: numbers.numbers[8],
            ),
            DigitButton(
              action: () {
                model.checkInput(numbers.numbers[9]);
              },
              text: numbers.numbers[9],
            ),
            DigitButton(
              action: () {
                model.checkInput(numbers.numbers[10]);
              },
              text: numbers.numbers[10],
            ),
            OperatorButton(
              action: () {
                model.checkInput(numbers.numbers[11]);
              },
              text: numbers.numbers[11],
            ),
          ],
        ),
        Row(
          children: [
            if (isExpanded) ...[
              ExtendedButton(
                action: () {},
                text: numbers.expanded[13],
              ),
            ],
            DigitButton(
              action: () {
                model.checkInput(numbers.numbers[12]);
              },
              text: numbers.numbers[12],
            ),
            DigitButton(
              action: () {
                model.checkInput(numbers.numbers[13]);
              },
              text: numbers.numbers[13],
            ),
            DigitButton(
              action: () {
                model.checkInput(numbers.numbers[14]);
              },
              text: numbers.numbers[14],
            ),
            OperatorButton(
              action: () {
                model.checkInput(numbers.numbers[15]);
              },
              text: numbers.numbers[15],
            ),
          ],
        ),
        Row(
          children: [
            OperatorButton(
              action: () {
                toggleKeyboard();
                widget.updateFlexCallback();
              },
              text: numbers.numbers[16],
            ),
            if (isExpanded) ...[
              DigitButton(
                action: () {},
                text: 'e',
              ),
            ],
            DigitButton(
              action: () {
                model.checkInput(numbers.numbers[17]);
              },
              text: numbers.numbers[17],
            ),
            DigitButton(
              action: () {
                model.checkInput(numbers.numbers[18]);
              },
              text: numbers.numbers[18],
            ),
            OperatorButton(
              action: () {
                model.evaluateExpression();
              },
              color: Colors.deepOrange,
              text: numbers.numbers[19],
            ),
          ],
        ),
      ],
    );
  }
}
