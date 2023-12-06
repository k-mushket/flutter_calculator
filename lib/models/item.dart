import 'package:flutter/material.dart';

class Item {
  final Widget widget;
  final IconData iconData;
  final VoidCallback? onPressed;
  final String description;

  Item({
    required this.description,
    required this.widget,
    required this.iconData,
    this.onPressed,
  });
}
