import 'package:flutter/material.dart';
import 'package:flutter_calculator/screens/calculator_screen.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CalculatorScreen(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.photo_size_select_large),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu_open),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.currency_exchange),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.format_indent_decrease),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
