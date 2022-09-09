import 'dart:ui';

import 'package:payqr/core/constants/icon.dart';
import 'package:payqr/data/models/payment_model.dart';

import '../../core/constants/style.dart';
import '../models/barhistory_model.dart';

List<HistoryModel> data = [
  HistoryModel(
      AppIcon.food,
      "food",
      1500,
      DateTime.utc(2002, 10, 5, 18, 20),
      const Color.fromARGB(255, 244, 166, 89)),
  HistoryModel(
      AppIcon.game,
      "game",
      350,
      DateTime.utc(2002, 10, 5, 13, 30),
      const Color.fromARGB(255, 134, 137, 228)),
  HistoryModel(
      AppIcon.health,
      "health",
      150,
      DateTime.utc(2002, 10, 5, 11, 42),
      const Color.fromARGB(255, 104, 220, 152)),
  HistoryModel(
      AppIcon.electr,
      "bills",
      220,
      DateTime.utc(2002, 10, 5, 10, 20),
      const Color.fromARGB(255, 220, 117, 162)),
  HistoryModel(
      AppIcon.book,
      "book",
      600,
      DateTime.utc(2002, 10, 5, 08, 32),
      const Color.fromARGB(255, 224, 187, 119)),
];

List<BarHistory> year = const [
  BarHistory("Jan", 2000, Color.fromARGB(255, 92, 195, 135)),
  BarHistory("Feb", 1900, Color.fromARGB(255, 116, 188, 240)),
  BarHistory("Mar", 2100, Color.fromARGB(255, 242, 179, 96)),
  BarHistory("Apr", 1800, Color.fromARGB(255, 137, 158, 197)),
  BarHistory("May", 1400, Color.fromARGB(255, 113, 225, 143)),
  BarHistory("Jun", 2000, Color.fromARGB(255, 246, 187, 110)),
  BarHistory("Jul", 1000, AppColor.secondary),
  BarHistory("Aug", 1000, AppColor.primary),
  BarHistory("Sep", 1600, AppColor.secondary),
  BarHistory("Oct", 2300, AppColor.primary),
  BarHistory("Nov", 1500, AppColor.primary),
  BarHistory("Dec", 2000, Color.fromARGB(255, 194, 101, 154)),
];

List<BarHistory> monthes = const [
  BarHistory("1", 2000, Color.fromARGB(255, 92, 195, 135)),
  BarHistory("2", 1900, Color.fromARGB(255, 116, 188, 240)),
  BarHistory("3", 2100, Color.fromARGB(255, 242, 179, 96)),
  BarHistory("4", 1800, Color.fromARGB(255, 137, 158, 197)),
   
];
