import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calculator/data/character_list.dart';
import 'package:flutter_calculator/providers/calculator_input.dart';
import 'package:flutter_calculator/widgets/calculator_screen/buttons/digit_button.dart';
import 'package:flutter_calculator/widgets/calculator_screen/buttons/operator_button.dart';
import 'package:flutter_calculator/widgets/calculator_screen/buttons/expanded_button.dart';

class CalculatorKeypad extends StatefulWidget {
  const CalculatorKeypad({super.key, required this.updateFlexCallback});

  final Function() updateFlexCallback;

  @override
  State<CalculatorKeypad> createState() => _CalculatorKeypadState();
}

class _CalculatorKeypadState extends State<CalculatorKeypad>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void toggleKeyboard() {
    setState(() {
      isExpanded = !isExpanded;
    });
    if (isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var numbers = CharacterList();
    var buttonProvider =
        Provider.of<CalculatorProvider>(context, listen: false);

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
                  action: () => buttonProvider.checkInput(numbers.expanded[8]),
                  text: numbers.expanded[8]),
              ExtendedButton(
                  action: () => buttonProvider.checkInput(numbers.expanded[9]),
                  text: numbers.expanded[9]),
            ],
          ),
        ],
        Row(
          children: [
            if (isExpanded) ...[
              ExtendedButton(
                action: () => buttonProvider.checkInput('√'),
                text: numbers.expanded[10],
              ),
            ],
            OperatorButton(
              action: () {
                buttonProvider.eraseExpression();
              },
              text: numbers.numbers[0],
            ),
            OperatorButton(
              action: () {
                buttonProvider.removeLastChar();
              },
              text: numbers.numbers[1],
            ),
            OperatorButton(
              action: () {
                buttonProvider.checkInput(numbers.numbers[2]);
              },
              text: numbers.numbers[2],
            ),
            OperatorButton(
              action: () {
                buttonProvider.checkInput('/');
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
                buttonProvider.checkInput(numbers.numbers[4]);
              },
              text: numbers.numbers[4],
            ),
            DigitButton(
              action: () {
                buttonProvider.checkInput(numbers.numbers[5]);
              },
              text: numbers.numbers[5],
            ),
            DigitButton(
              action: () {
                buttonProvider.checkInput(numbers.numbers[6]);
              },
              text: numbers.numbers[6],
            ),
            OperatorButton(
              action: () {
                buttonProvider.checkInput('*');
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
                buttonProvider.checkInput(numbers.numbers[8]);
              },
              text: numbers.numbers[8],
            ),
            DigitButton(
              action: () {
                buttonProvider.checkInput(numbers.numbers[9]);
              },
              text: numbers.numbers[9],
            ),
            DigitButton(
              action: () {
                buttonProvider.checkInput(numbers.numbers[10]);
              },
              text: numbers.numbers[10],
            ),
            OperatorButton(
              action: () {
                buttonProvider.checkInput(numbers.numbers[11]);
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
                buttonProvider.checkInput(numbers.numbers[12]);
              },
              text: numbers.numbers[12],
            ),
            DigitButton(
              action: () {
                buttonProvider.checkInput(numbers.numbers[13]);
              },
              text: numbers.numbers[13],
            ),
            DigitButton(
              action: () {
                buttonProvider.checkInput(numbers.numbers[14]);
              },
              text: numbers.numbers[14],
            ),
            OperatorButton(
              action: () {
                buttonProvider.checkInput(numbers.numbers[15]);
              },
              text: numbers.numbers[15],
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Center(
                child: ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(0.2),
                      onTap: () {
                        toggleKeyboard();
                        widget.updateFlexCallback();
                      },
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _animationController.value * 2.0 * pi,
                              child: child,
                            );
                          },
                          child: Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            key: ValueKey(isExpanded),
                            size: 30.0,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (isExpanded) ...[
              DigitButton(
                action: () {},
                text: 'e',
              ),
            ],
            DigitButton(
              action: () {
                buttonProvider.checkInput(numbers.numbers[17]);
              },
              text: numbers.numbers[17],
            ),
            DigitButton(
              action: () {
                buttonProvider.checkInput(numbers.numbers[18]);
              },
              text: numbers.numbers[18],
            ),
            OperatorButton(
              action: () {
                buttonProvider.evaluateExpression();
              },
              color: Colors.deepOrangeAccent,
              text: numbers.numbers[19],
            ),
          ],
        ),
      ],
    );
  }
}
