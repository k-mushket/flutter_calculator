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
      child: Center(
        child: ClipOval(
          child: Material(
            color: color,
            child: InkWell(
              splashColor:
                  Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
              onTap: action,
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      color: (color == null)
                          ? Theme.of(context).colorScheme.surface
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
