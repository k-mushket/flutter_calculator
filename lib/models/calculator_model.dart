import 'package:flutter/widgets.dart';

class CalculatorModel extends ChangeNotifier {
  String _input = '';
  String _result = '';

  void setInput(String input) {
    _input = input;
    notifyListeners();
  }

  String get input => _input;
  String get result => _result;
}
