import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_calculator/models/item.dart';
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

List<Item> economicItems = [
  Item(
    widget: Age(),
    iconData: FontAwesomeIcons.cakeCandles,
    description: 'Age',
  ),
  Item(
    widget: Area(),
    iconData: FontAwesomeIcons.square,
    description: 'Area',
  ),
  Item(
    widget: Bmi(),
    iconData: FontAwesomeIcons.weightScale,
    description: 'BMI',
  ),
  Item(
    widget: Data(),
    iconData: FontAwesomeIcons.database,
    description: 'Data',
  ),
  Item(
    widget: Date(),
    iconData: FontAwesomeIcons.calendar,
    description: 'Date',
  ),
  Item(
    widget: Discount(),
    iconData: Icons.discount,
    description: 'Discount',
  ),
  Item(
    widget: Length(),
    iconData: FontAwesomeIcons.ruler,
    description: 'Length',
  ),
  Item(
    widget: Mass(),
    iconData: FontAwesomeIcons.weightHanging,
    description: 'Mass',
  ),
  Item(
    widget: NumeralSystem(),
    iconData: FontAwesomeIcons.listOl,
    description: 'Numeral system',
  ),
  Item(
    widget: Speed(),
    iconData: FontAwesomeIcons.gauge,
    description: 'Speed',
  ),
  Item(
    widget: Temperature(),
    iconData: FontAwesomeIcons.temperatureFull,
    description: 'Temperature',
  ),
  Item(
    widget: Time(),
    iconData: FontAwesomeIcons.clock,
    description: 'Time',
  ),
  Item(
    widget: Volume(),
    iconData: FontAwesomeIcons.cube,
    description: 'Volume',
  ),
];

List<Item> additionalItems = [
  Item(
    widget: Age(),
    iconData: FontAwesomeIcons.dollarSign,
    description: 'Currency',
  ),
  Item(
    widget: Area(),
    iconData: FontAwesomeIcons.chartArea,
    description: 'Investment',
  ),
  Item(
    widget: Bmi(),
    iconData: FontAwesomeIcons.handHoldingDollar,
    description: 'Loan',
  ),
];
