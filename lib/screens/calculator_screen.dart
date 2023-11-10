import 'package:flutter/material.dart';
import 'package:flutter_calculator/components/calculator_screen/calculator_keypad.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Center(child: Text('asdg')),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
          ),
          Expanded(
            child: CalculatorKeypad(),
          ),
        ],
      ),
    );
  }
}
