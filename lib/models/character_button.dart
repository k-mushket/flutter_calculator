import 'package:flutter/material.dart';

class CharacterButton extends StatelessWidget {
  const CharacterButton(
      {super.key, this.color, required this.action, required this.text});

  final Color? color;
  final void Function() action;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: action,
      style: TextButton.styleFrom(
        foregroundColor: color,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
