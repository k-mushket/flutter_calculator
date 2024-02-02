import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator.dart';
import 'package:flutter_calculator/models/calculator_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CalculatorModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Calculator(),
      ),
    ),
  );
}
