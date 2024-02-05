import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_calculator/screens/history_screen.dart';
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
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _pageChanged() {
    int? currentPage = _pageController.page?.round();
    if (currentPage != null && currentPage != _currentPage) {
      setState(() {
        _currentPage = currentPage;
      });
    }
  }

  void _navigateTo(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
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
              icon: const FaIcon(FontAwesomeIcons.downLeftAndUpRightToCenter),
            ),
            IconButton(
              onPressed: () => _navigateTo(0),
              icon: Icon(
                FontAwesomeIcons.equals,
                color: _currentPage == 0 ? Colors.orange : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () => _navigateTo(1),
              icon: Icon(
                FontAwesomeIcons.tableCells,
                color: _currentPage == 1 ? Colors.orange : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () => _navigateTo(2),
              icon: Icon(
                FontAwesomeIcons.sackDollar,
                color: _currentPage == 2 ? Colors.orange : Colors.black,
              ),
            ),
            PopupMenuButton(
              onSelected: (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryScreen(),
                ),
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  padding: EdgeInsets.all(1),
                  value: 'History',
                  child: Row(
                    children: [
                      Icon(Icons.history),
                      SizedBox(width: 5),
                      Text('History'),
                    ],
                  ),
                ),
              ],
              offset: const Offset(0, 40),
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
