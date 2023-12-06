import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_calculator/screens/additional_screen.dart';
import 'package:flutter_calculator/screens/calculator_screen.dart';
import 'package:flutter_calculator/screens/economic_screen.dart';

class Calculator extends StatefulWidget with WidgetsBindingObserver {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final PageController _pageController = PageController();

  void _navigateTo(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.downLeftAndUpRightToCenter),
            ),
            IconButton(
              onPressed: () => _navigateTo(0),
              icon: Icon(FontAwesomeIcons.equals),
            ),
            IconButton(
              onPressed: () => _navigateTo(1),
              icon: Icon(FontAwesomeIcons.tableCells),
            ),
            IconButton(
              onPressed: () => _navigateTo(2),
              icon: Icon(FontAwesomeIcons.sackDollar),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          CalculatorScreen(),
          EconomicScreen(),
          AdditionalScreen(),
        ],
      ),
    );
  }
}
