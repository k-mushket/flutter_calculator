import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/calculator_screen/calculator_display.dart';
import 'package:flutter_calculator/widgets/calculator_screen/calculator_keypad.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Center(child: CalculatorDisplay())),
        Divider(
          indent: 20,
          endIndent: 20,
        ),
        Expanded(child: CalculatorKeypad()),
      ],
    );
  }
}
