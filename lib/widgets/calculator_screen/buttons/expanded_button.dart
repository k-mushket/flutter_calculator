import 'package:flutter/material.dart';

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
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
