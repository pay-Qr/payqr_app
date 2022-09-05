import 'package:flutter/material.dart';

class HistoryModel {
  final String place;
  final double price;
  final DateTime time;
  final IconData icon;
  final Color color;

  HistoryModel(
    this.icon,
    this.place,
    this.price,
    this.time,
    this.color,
  );
}
