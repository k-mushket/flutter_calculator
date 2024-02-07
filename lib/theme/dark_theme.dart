import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[600]!,
    secondary: Colors.white,
    tertiary: Colors.grey[800],
    primaryContainer: Colors.grey[900],
  ),
);
