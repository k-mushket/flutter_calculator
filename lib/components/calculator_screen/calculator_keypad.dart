import 'package:flutter/material.dart';
import 'package:flutter_calculator/models/character_button.dart';

class CalculatorKeypad extends StatefulWidget {
  const CalculatorKeypad({super.key});

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
    return Column(
      children: [
        if (isExpanded) ...[
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CharacterButton(action: () {}, text: '2nd'),
                  CharacterButton(action: () {}, text: 'deg'),
                  CharacterButton(action: () {}, text: 'sin'),
                  CharacterButton(action: () {}, text: 'cos'),
                  CharacterButton(action: () {}, text: 'tan'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CharacterButton(action: () {}, text: 'x\u02B8'),
                  CharacterButton(action: () {}, text: 'lg'),
                  CharacterButton(action: () {}, text: 'ln'),
                  CharacterButton(action: () {}, text: '('),
                  CharacterButton(action: () {}, text: ')'),
                ],
              ),
            ],
          ),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (isExpanded) ...[
              Column(
                children: [
                  CharacterButton(action: () {}, text: '\u221ax'),
                  CharacterButton(action: () {}, text: 'x!'),
                  CharacterButton(action: () {}, text: '\u0031\u2044\u2093'),
                  CharacterButton(action: () {}, text: '\u03C0'),
                  CharacterButton(action: () {}, text: '\u0065'),
                ],
              ),
            ],
            Column(
              children: [
                Row(
                  children: [
                    CharacterButton(action: () {}, text: '+'),
                    CharacterButton(action: () {}, text: '+'),
                    CharacterButton(action: () {}, text: '+'),
                    CharacterButton(action: () {}, text: '+'),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CharacterButton(action: () {}, text: '7'),
                            CharacterButton(action: () {}, text: '8'),
                            CharacterButton(action: () {}, text: '9'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CharacterButton(action: () {}, text: '4'),
                            CharacterButton(action: () {}, text: '5'),
                            CharacterButton(action: () {}, text: '6'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CharacterButton(action: () {}, text: '1'),
                            CharacterButton(action: () {}, text: '2'),
                            CharacterButton(action: () {}, text: '3'),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CharacterButton(action: () {}, text: '*'),
                        CharacterButton(action: () {}, text: '-'),
                        CharacterButton(action: () {}, text: '+'),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CharacterButton(
                        action: () => toggleKeyboard(), text: '\u21BB'),
                    CharacterButton(action: () {}, text: '0'),
                    CharacterButton(action: () {}, text: '.'),
                    CharacterButton(action: () {}, text: '='),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
