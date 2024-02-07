import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_calculator/models/calculator_model.dart';

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorModel>(
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
