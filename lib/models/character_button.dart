import 'package:flutter/material.dart';

class CharacterButton extends StatelessWidget {
  const CharacterButton({super.key, required this.action, required this.text});

  final void Function() action;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: action, child: text);
  }
}
