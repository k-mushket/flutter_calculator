import 'package:flutter/widgets.dart';
import 'dart:math';

class CalculatorModel extends ChangeNotifier {
  String _input = '0';
  String _commonResult = '0';
  var temp;
  double? inputTextSize = 52;
  double? previewRTextSize = 26;
  List<num> numbers = [];
  List<String> operators = [];

  String get input => _input;
  String get previewResult => _commonResult;

  void changeSize() {
    previewRTextSize = 52;
    inputTextSize = 26;
  }

  void checkInput(String char) {
    if (char == '%' && _input == '0') {
      return;
    } else if (char == '%' && !_isLastCharacterOperator()) {
      _calculatePercentage();
    } else if (_isLastCharacterOperator() && _isOperator(char)) {
      _input = _input.substring(0, _input.length - 1) + char;
    } else if (char == '(' || char == ')') {
      if (_input == '0') {
        _input = char;
      } else {
        _input += char;
      }
    } else {
      if (_input == '0') {
        if (char == '.') {
          _input = '0.';
        } else if (_isOperator(char)) {
          _input += char;
        } else {
          _input = char;
        }
      } else if (char == '.' && _isLastCharacterOperator()) {
        _input += '0.';
      } else {
        _input += char;
      }
    }
    _previewExpression();
    notifyListeners();
  }

  void _previewExpression() {
    try {
      numbers.clear();
      operators.clear();

      RegExp regex = RegExp(r'(\d+\.?\d*)|([+-/*%()√])');
      for (var match in regex.allMatches(_input)) {
        String token = match.group(0)!;
        if (_isOperator(token)) {
          operators.add(token);
        } else {
          numbers.add(num.parse(token));
        }
      }

      if (numbers.isNotEmpty && numbers.length != operators.length) {
        temp = numbers[0];
        for (int i = 0; i < operators.length; i++) {
          switch (operators[i]) {
            case '+':
              temp += numbers[i + 1];
              break;
            case '-':
              temp -= numbers[i + 1];
              break;
            case '*':
              temp *= numbers[i + 1];
              break;
            case '/':
              var exp = temp / numbers[i + 1];
              if (exp.isNaN) {
                temp = "can't divide by zero";
              } else {
                temp = exp % 1 == 0 ? exp.toInt() : exp;
              }
              break;
            case '√':
              temp = sqrt(numbers[i]);
              break;
          }
        }
      }

      _commonResult = temp.toString();
      notifyListeners();
    } catch (e) {
      _commonResult = '$e';
      notifyListeners();
    }
  }

  void evaluateExpression() {
    _commonResult;
    changeSize();
    notifyListeners();
  }

  void eraseExpression() {
    _input = '0';
    inputTextSize = 52;
    previewRTextSize = 26;
    notifyListeners();
  }

  void removeLast() {
    if (_input.length == 1) {
      inputTextSize = 52;
      previewRTextSize = 26;
      _input = '0';
    } else if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
    }
    notifyListeners();
  }

  void _calculatePercentage() {
    int i = _input.length - 1;
    while (i >= 0 && '0123456789.'.contains(_input[i])) {
      i--;
    }
    String percent = _input.substring(i + 1);
    try {
      num number = num.parse(percent);
      String result = (number / 100).toString();
      _input = _input.substring(0, i + 1) + result;
    } catch (e) {
      _input = '$e';
    }
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
}
