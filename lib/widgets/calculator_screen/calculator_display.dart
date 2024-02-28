import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calculator/providers/calculator_input.dart';

class CalculatorDisplay extends StatefulWidget {
  const CalculatorDisplay({super.key});

  @override
  State<CalculatorDisplay> createState() => _CalculatorDisplayState();
}

class _CalculatorDisplayState extends State<CalculatorDisplay> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      builder: (context, model, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...model.historyStorage.map(
              (e) => Text(
                e,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Text(
              model.input,
              style: TextStyle(
                  fontSize: model.inputTextSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            if (model.input != '0')
              Text(
                '=${model.previewResult}',
                style: TextStyle(
                    fontSize: model.previewResultTextSize,
                    color: Theme.of(context).colorScheme.secondary),
              ),
          ],
        );
      },
    );
  }
}
