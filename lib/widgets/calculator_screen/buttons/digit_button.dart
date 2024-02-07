import 'package:flutter/material.dart';

class DigitButton extends StatelessWidget {
  const DigitButton(
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
          foregroundColor: Theme.of(context).colorScheme.secondary,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
