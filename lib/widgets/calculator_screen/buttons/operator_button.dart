import 'package:flutter/material.dart';

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
          foregroundColor: Theme.of(context).colorScheme.surface,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
