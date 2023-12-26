import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calculator/data/character_list.dart';
import 'package:flutter_calculator/models/calculator_model.dart';
import 'package:flutter_calculator/models/character_button.dart';
import 'package:flutter_calculator/models/expanded_button.dart';

class CalculatorKeypad extends StatefulWidget {
  const CalculatorKeypad({super.key});

  @override
  State<CalculatorKeypad> createState() => _CalculatorKeypadState();
}

class _CalculatorKeypadState extends State<CalculatorKeypad> {
  bool isExpanded = true;

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
      children: [
        if (isExpanded) ...[
          Row(
            children: [
              ExtendedButton(action: () {}, text: '${numbers.expanded[0]}'),
              ExtendedButton(action: () {}, text: '${numbers.expanded[1]}'),
              ExtendedButton(action: () {}, text: '${numbers.expanded[2]}'),
              ExtendedButton(action: () {}, text: '${numbers.expanded[3]}'),
              ExtendedButton(action: () {}, text: '${numbers.expanded[4]}'),
            ],
          ),
          Row(
            children: [
              ExtendedButton(action: () {}, text: '${numbers.expanded[5]}'),
              ExtendedButton(action: () {}, text: '${numbers.expanded[6]}'),
              ExtendedButton(action: () {}, text: '${numbers.expanded[7]}'),
              ExtendedButton(action: () {}, text: '${numbers.expanded[8]}'),
              ExtendedButton(action: () {}, text: '${numbers.expanded[9]}'),
            ],
          ),
        ],
        Row(
          children: [
            if (isExpanded) ...[
              ExtendedButton(
                action: () {},
                text: '${numbers.expanded[10]}',
              ),
            ],
            CharacterButton(
              action: () {
                model.eraseExpression();
              },
              text: '${numbers.numbers[0]}',
            ),
            CharacterButton(
              action: () {
                model.removeLast();
              },
              text: '${numbers.numbers[1]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[2]);
              },
              text: '${numbers.numbers[2]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[3]);
              },
              text: '${numbers.numbers[3]}',
            ),
          ],
        ),
        Row(
          children: [
            if (isExpanded) ...[
              ExtendedButton(
                action: () {},
                text: '${numbers.expanded[11]}',
              ),
            ],
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[4]);
              },
              text: '${numbers.numbers[4]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[5]);
              },
              text: '${numbers.numbers[5]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[6]);
              },
              text: '${numbers.numbers[6]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[7]);
              },
              text: '${numbers.numbers[7]}',
            ),
          ],
        ),
        Row(
          children: [
            if (isExpanded) ...[
              ExtendedButton(
                action: () {},
                text: '${numbers.expanded[12]}',
              ),
            ],
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[8]);
              },
              text: '${numbers.numbers[8]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[9]);
              },
              text: '${numbers.numbers[9]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[10]);
              },
              text: '${numbers.numbers[10]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[11]);
              },
              text: '${numbers.numbers[11]}',
            ),
          ],
        ),
        Row(
          children: [
            if (isExpanded) ...[
              ExtendedButton(
                action: () {},
                text: '${numbers.expanded[13]}',
              ),
            ],
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[12]);
              },
              text: '${numbers.numbers[12]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[13]);
              },
              text: '${numbers.numbers[13]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[14]);
              },
              text: '${numbers.numbers[14]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[15]);
              },
              text: '${numbers.numbers[15]}',
            ),
          ],
        ),
        Row(
          children: [
            if (isExpanded) ...[
              ExtendedButton(
                action: () {},
                text: '${numbers.expanded[12]}',
              ),
            ],
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[16]);
              },
              text: '${numbers.numbers[16]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[17]);
              },
              text: '${numbers.numbers[17]}',
            ),
            CharacterButton(
              action: () {
                model.setInput(numbers.numbers[18]);
              },
              text: '${numbers.numbers[18]}',
            ),
            CharacterButton(
              action: () {
                model.evaluateExpression();
              },
              text: '${numbers.numbers[19]}',
            ),
          ],
        ),
      ],
    );
  }
}

// CharacterButton(action: () => toggleKeyboard(), text: '-'),