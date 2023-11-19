import 'package:flutter/material.dart';
import 'package:flutter_calculator/theme/colors.dart';

class ExtendedButton extends StatelessWidget {
  const ExtendedButton(
      {super.key, this.color, required this.action, required this.text});

  final Color? color;
  final void Function() action;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: action,
        style: TextButton.styleFrom(
          foregroundColor: extendedColor,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
