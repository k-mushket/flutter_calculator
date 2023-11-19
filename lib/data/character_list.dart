import 'package:flutter/material.dart';
import 'package:flutter_calculator/models/character_button.dart';
import 'package:flutter_calculator/components/calculator_screen/calculator_keypad.dart';

class CharacterList {
  final List<String> numbers = [
    'AC',
    '\u232B',
    '%',
    '\u00F7',
    '7',
    '8',
    '9',
    '\u0078',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '\u21BB',
    '0',
    '.',
    '=',
  ];

  final List<String> expanded = [
    '2nd',
    'deg',
    'sin',
    'cos',
    'tan',
    'x\u02B8',
    'lg',
    'ln',
    '(',
    ')',
  ];
}
