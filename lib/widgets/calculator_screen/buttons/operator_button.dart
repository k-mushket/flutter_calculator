import 'package:flutter/material.dart';
import 'package:flutter_calculator/theme/colors.dart';

class OperatorButton extends StatelessWidget {
  const OperatorButton({
    super.key,
    this.color,
    required this.action,
    required this.text,
  });

  final Color? color;
  final VoidCallback action;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: action,
        style: TextButton.styleFrom(
          foregroundColor: operationColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
