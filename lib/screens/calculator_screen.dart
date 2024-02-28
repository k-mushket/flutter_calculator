import 'package:flutter/material.dart';
import 'package:flutter_calculator/widgets/calculator_screen/calculator_display.dart';
import 'package:flutter_calculator/widgets/calculator_screen/calculator_keypad.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int flexDisplay = 1;
  int flexKeypad = 1;

  void updateFlexValues() {
    if (flexDisplay == 1 && flexKeypad == 1) {
      setState(() {
        flexDisplay = 2;
        flexKeypad = 3;
      });
    } else {
      setState(() {
        flexDisplay = 1;
        flexKeypad = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Flexible(
              flex: flexDisplay,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.bottomRight,
                child: const SingleChildScrollView(
                  reverse: true,
                  child: SizedBox(
                    width: double.infinity,
                    child: CalculatorDisplay(),
                  ),
                ),
              ),
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              thickness: 0.3,
            ),
            Flexible(
              flex: flexKeypad,
              child: CalculatorKeypad(
                updateFlexCallback: updateFlexValues,
              ),
            ),
          ],
        );
      },
    );
  }
}
