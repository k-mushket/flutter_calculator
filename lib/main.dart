import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator/calculator.dart';
import 'package:flutter_calculator/providers/calculator_input.dart';
import 'package:flutter_calculator/theme/dark_theme.dart';
import 'package:flutter_calculator/theme/light_theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      ChangeNotifierProvider(
        create: (context) => CalculatorProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home: const Calculator(),
        ),
      ),
    );
  });
}
