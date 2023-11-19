import 'package:flutter/material.dart';
import 'package:flutter_calculator/data/character_list.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isExpanded) ...[
          Row(
            children: [
              for (int j = 0; j < 5; j++)
                ExtendedButton(action: () {}, text: '${numbers.expanded[j]}'),
            ],
          ),
          Row(
            children: [
              for (int j = 5; j < 10; j++)
                ExtendedButton(action: () {}, text: '${numbers.expanded[j]}'),
            ],
          ),
        ],
        for (int i = 0; i < 4; i++)
          Row(
            children: [
              if (isExpanded) ...[
                ExtendedButton(action: () {}, text: '${numbers.expanded[0]}'),
              ],
              for (int j = 0; j < 4; j++)
                CharacterButton(action: () {}, text: '${numbers.numbers[j]}'),
            ],
          ),
      ],
    );
  }
}

// CharacterButton(action: () => toggleKeyboard(), text: '-'),