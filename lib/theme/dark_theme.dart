import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[600]!,
    secondary: Color.fromARGB(220, 255, 255, 255),
    tertiary: Colors.grey[500],
    primaryContainer: Colors.grey[900],
    surface: Colors.deepOrange,
  ),
);
