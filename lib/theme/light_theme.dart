import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.grey[600]!,
    secondary: Colors.black,
    tertiary: Colors.grey[800],
    primaryContainer: Colors.white,
  ),
);
