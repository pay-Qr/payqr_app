import 'package:payqr/core/constants/icon.dart';
import 'package:payqr/data/models/payment_model.dart';

import '../../core/constants/style.dart';
import '../models/barhistory_model.dart';

List<HistoryModel> data = [
  HistoryModel(
      AppIcon.food, "food", 150, DateTime.now()),
  HistoryModel(
      AppIcon.game, "game", 150, DateTime.now()),
  HistoryModel(AppIcon.health, "health", 150,
      DateTime.now()),
  HistoryModel(AppIcon.electr, "bills", 150,
      DateTime.now()),
  HistoryModel(
      AppIcon.book, "book", 150, DateTime.now()),
];



List<BarHistory> BarData = const [
  BarHistory("Jan", 2000,  AppColor.primary ),
  BarHistory("Feb", 1900,  AppColor.secondary),
  BarHistory("Mar", 2100,  AppColor.blue),
  BarHistory("Apr", 1800,  AppColor.text),
  BarHistory("May", 1400,  AppColor.secondary),
  BarHistory("Jun", 2000,  AppColor.primary),
  BarHistory("Jul", 1000,  AppColor.secondary),
  BarHistory("Aug", 1000,  AppColor.primary),
  BarHistory("Sep", 1600,  AppColor.secondary),
  BarHistory("Oct", 2300,  AppColor.primary),
  BarHistory("Nov", 1500,  AppColor.primary),
  BarHistory("Dec", 2000,  AppColor.primary),
];
