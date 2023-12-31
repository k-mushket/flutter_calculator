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
          children: [
            Text(
              model.input,
              style: TextStyle(fontSize: model.inputTextSize),
            ),
            if (model.input != '0')
              Text(
                '=${model.previewResult}',
                style: TextStyle(fontSize: model.previewRTextSize),
              ),
          ],
        );
      },
    );
  }
}
