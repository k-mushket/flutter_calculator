import 'package:flutter/widgets.dart';

class CalculatorModel extends ChangeNotifier {
  String _input = '0';
  var result;
  List<num> numbers = [];
  List<String> operators = [];

  void setInput(String char) {
    if (char == '%' && _input == '0') {
      return; 
    } else if (_isLastCharacterOperator() && _isOperator(char)) {
      _input = _input.substring(0, _input.length - 1) + char;
    } else if (char == '%') {
      int i = _input.length - 1;
      while (i >= 0 && '0123456789.'.contains(_input[i])) {
        i--;
      }
      String percent = _input.substring(i + 1);
      String result = _calculatePercentage(percent);
      _input = _input.substring(0, i + 1) + result;
    } else {
      if (_input == '0' && char != '.') {
        _input = (char == '.' ? '0.' : char);
      } else {
        _input += char;
      }
    }

    notifyListeners();
  }

  String _calculatePercentage(String percent) {
    num number = num.parse(percent);
    return (number / 100).toString();
  }

  bool _isLastCharacterOperator() {
    if (_input.isEmpty) {
      return false;
    }

    String char = _input[_input.length - 1];
    return _isOperator(char);
  }

  bool _isOperator(String char) {
    return ['/', '*', '+', '-'].contains(char);
  }

  void evaluateExpression() {
    numbers = [];
    operators = [];

    RegExp regex = RegExp(r'(\d+\.?\d*)|([+-/*%])');
    for (var match in regex.allMatches(_input)) {
      String token = match.group(0)!;
      if (_isOperator(token)) {
        operators.add(token);
      } else {
        numbers.add(num.parse(token));
      }
    }

    if (numbers.isNotEmpty) {
      result = numbers[0];
      for (int i = 0; i < operators.length; i++) {
        switch (operators[i]) {
          case '+':
            result += numbers[i + 1];
            break;
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
    }

    _input = result.toString();
    notifyListeners();
  }

  void eraseExpression() {
    _input = '0';
    notifyListeners();
  }

  void removeLast() {
    if (_input.length == 1) {
      _input = '0';
    } else if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
    }
    notifyListeners();
  }

  String get input => _input;
}
