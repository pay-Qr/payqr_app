import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:payqr/views/screens/dashboard/history.dart';
import 'package:payqr/views/screens/dashboard/home.dart';

List<IconData> bottomBarItems = const [
  Ionicons.home,
  Ionicons.time,
  Ionicons.bar_chart,
  Ionicons.person,
];

List<Widget> widgetOptions = <Widget>[
  const Home(),
  const History(),
  const Text(
    'Index 3: Settings',
  ),
  const Text(
    'Index 2: Business',
  ),
];
