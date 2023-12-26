import 'package:flutter/widgets.dart';

class CalculatorModel extends ChangeNotifier {
  String _input = '';
  var result;
  List<int> numbers = [];
  List<String> operators = [];

  void setInput(String input) {
    _input += input;
    notifyListeners();
  }

  void evaluateExpression() {
    numbers = _input
        .split(RegExp(r'[+-/*%]'))
        .map((string) => int.parse(string.trim()))
        .toList();
    operators = _input
        .split(RegExp(r'\d+(\.\d+)?'))
        .where((string) => string.isNotEmpty)
        .toList();

    result = numbers[0];
    for (int i = 0; i < numbers.length - 1; i++) {
      switch (operators[i]) {
        case '+':
          result += numbers[i + 1];
        case '-':
          result -= numbers[i + 1];
          break;

        case '*':
          result *= numbers[i + 1];
          break;

        case '/':
          result /= numbers[i + 1];
          break;
      }
    }
    _input = result.toString();
    notifyListeners();
  }

  void eraseExpression() {
    if (_input.isNotEmpty) {
      _input = '';
      notifyListeners();
    }
  }

  void removeLast() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
      notifyListeners();
    }
  }

  void calculatePercentage() {
    if (_input.isNotEmpty) {
      double expressionDivider = 1;
      for (int i = 0; i < _input.length; i++) {
        expressionDivider *= 10;
      }

      _input = (double.parse(_input) / expressionDivider).toString();
      notifyListeners();
    }
  }

  String get input => _input;
}
