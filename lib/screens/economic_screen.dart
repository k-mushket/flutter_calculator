import 'package:flutter/material.dart';
import 'package:flutter_calculator/screens/economic_screen/age_page.dart';
import 'package:flutter_calculator/screens/economic_screen/area_page.dart';
import 'package:flutter_calculator/screens/economic_screen/bmi_page.dart';
import 'package:flutter_calculator/screens/economic_screen/data_page.dart';
import 'package:flutter_calculator/screens/economic_screen/date_page.dart';
import 'package:flutter_calculator/screens/economic_screen/discount_page.dart';
import 'package:flutter_calculator/screens/economic_screen/length_page.dart';
import 'package:flutter_calculator/screens/economic_screen/mass_page.dart';
import 'package:flutter_calculator/screens/economic_screen/numeral_system_page.dart';
import 'package:flutter_calculator/screens/economic_screen/speed_page.dart';
import 'package:flutter_calculator/screens/economic_screen/temperature_page.dart';
import 'package:flutter_calculator/screens/economic_screen/time_page.dart';
import 'package:flutter_calculator/screens/economic_screen/volume_page.dart';

class EconomicItem {
  final Widget widget;
  final IconData iconData;
  final VoidCallback? onPressed;

  EconomicItem({required this.widget, required this.iconData, this.onPressed});
}

class EconomicScreen extends StatelessWidget {
  List<EconomicItem> items = [
    EconomicItem(widget: Age(), iconData: Icons.cake),
    EconomicItem(widget: Area(), iconData: Icons.area_chart),
    EconomicItem(widget: Bmi(), iconData: Icons.balance),
    EconomicItem(widget: Data(), iconData: Icons.data_array),
    EconomicItem(widget: Date(), iconData: Icons.date_range),
    EconomicItem(widget: Discount(), iconData: Icons.discount),
    EconomicItem(widget: Length(), iconData: Icons.rule_outlined),
    EconomicItem(widget: Mass(), iconData: Icons.missed_video_call_sharp),
    EconomicItem(widget: NumeralSystem(), iconData: Icons.format_list_numbered),
    EconomicItem(widget: Speed(), iconData: Icons.speed),
    EconomicItem(widget: Temperature(), iconData: Icons.thermostat),
    EconomicItem(widget: Time(), iconData: Icons.timelapse),
    EconomicItem(widget: Volume(), iconData: Icons.indeterminate_check_box),
  ];

  EconomicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        EconomicItem item = items[index];

        return IconButton(
          icon: Icon(item.iconData),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => item.widget),
            );
          },
        );
      },
    );
  }
}
