import 'package:flutter/widgets.dart';
import 'dart:math';

//TODO: Prioritising the order of operations
class CalculatorProvider extends ChangeNotifier {
  String _input = '0';
  String _commonResult = '0';

  bool _resultShown = false;
  dynamic temp;
  double inputTextSize = 52;
  double previewResultTextSize = 30;
  final List<String> _historyStorage = [];
  List<num> numbers = [];
  List<String> operators = [];

  set input(e) {
    _input = e;
    notifyListeners();
  }

  List<String> get historyStorage => _historyStorage;
  String get input => _input;
  String get previewResult => _commonResult;

  void _changeSize() {
    inputTextSize = 30;
    previewResultTextSize = 52;
    notifyListeners();
  }

  void checkInput(String char) {
    if (_resultShown) {
      // Якщо результат вже показаний, додаємо попередній вираз до історії
      _historyStorage.add('$_input\n=$_commonResult');
      eraseExpression(); // Очищаємо вираз та результат для нового введення
      _resultShown = false; // Скидаємо прапорець показу результату
    }

    if (char == '%' && _input == '0' ||
        (_input.endsWith('.') && char == '.') ||
        (char == '.' &&
            _input.split(RegExp(r'[\+\-\*\/]')).last.contains('.')) ||
        (char == '%' && _isLastCharacterOperator())) {
      return;
    } else if (char == '%') {
      calculatePercentage();
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

  void updateAndPreviewExpression(String expression) {
    _input = expression;
    _previewExpression();
    notifyListeners();
  }

  void evaluateExpression() {
    _previewExpression(); // Переконайтеся, що цей метод коректно розраховує _commonResult

    // Тепер не додаємо вираз до історії одразу
    _changeSize();

    // Замість додавання в історію, встановлюємо прапорець, що результат був показаний
    _resultShown = true;

    notifyListeners();
  }

  void startNewExpression(String char) {
    if (_input != '0' || _commonResult != '0') {
      // Додаємо попередній вираз і його результат до історії
      _historyStorage.add('$_input\n=$_commonResult');
      eraseExpression(); // Очищуємо вираз та результат
    }

    checkInput(char); // Починаємо новий вираз із введеним символом
  }

  void eraseExpression() {
    _input = '0';
    _commonResult = '0';
    inputTextSize = 52;
    previewResultTextSize = 30;
    notifyListeners();
  }

  void removeHistory() {
    _historyStorage.clear();
    notifyListeners();
  }

  void removeLastChar() {
    if (_input.length == 1) {
      inputTextSize = 52;
      previewResultTextSize = 30;
      _input = '0';
    } else if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
    }
    notifyListeners();
  }

  void calculatePercentage() {
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
    return ['/', '*', '+', '-', '(', ')'].contains(char);
  }
}
