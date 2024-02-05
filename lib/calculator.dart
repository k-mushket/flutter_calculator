import 'package:flutter/material.dart';
import 'package:flutter_calculator/pip.dart';
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
  bool historyPop = false;

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
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _showOverlay(BuildContext context) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.12,
        right: MediaQuery.of(context).size.width * 0.06,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black26,
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                overlayEntry?.remove();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HistoryScreen(),
                  ),
                );
              },
              child: const Row(
                children: [
                  Icon(Icons.history),
                  SizedBox(width: 5),
                  Text('History'),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: _currentPage == 0,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: IconButton(
                onPressed: () {
                  PiPService.enterPiPMode();
                },
                icon: const Icon(FontAwesomeIcons.downLeftAndUpRightToCenter),
              ),
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
                Icons.grid_view,
                color: _currentPage == 1 ? Colors.orange : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () => _navigateTo(2),
              icon: Icon(
                FontAwesomeIcons.circleDollarToSlot,
                color: _currentPage == 2 ? Colors.orange : Colors.black,
              ),
            ),
            Visibility(
              visible: _currentPage == 0,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: IconButton(
                onPressed: () => _showOverlay(context),
                icon: const Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: PageView(
          controller: _pageController,
          children: const [
            CalculatorScreen(),
            EconomicScreen(),
            AdditionalScreen(),
          ],
        ),
      ),
    );
  }
}
