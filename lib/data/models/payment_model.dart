import 'package:flutter/material.dart';

import '../../core/constants/icon.dart';

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

class ItemModel {
  final IconData icon;
  final Color title;

  ItemModel(
    this.icon,
    this.title,
  );
}

Map itemModel = {
  "SuperMarket": ItemModel(AppIcon.shoping,
      const Color.fromARGB(255, 207, 82, 73)),
  "Food": ItemModel(AppIcon.food,
      const Color.fromARGB(255, 244, 166, 89)),
  "Game": ItemModel(AppIcon.game,
      const Color.fromARGB(255, 134, 137, 228)),
  "Health": ItemModel(AppIcon.health,
      const Color.fromARGB(255, 104, 220, 152)),
  "Electr": ItemModel(AppIcon.electr,
      const Color.fromARGB(255, 220, 117, 162)),
  "Book": ItemModel(AppIcon.book,
      const Color.fromARGB(255, 224, 187, 119)),
  "cloths": ItemModel(AppIcon.cloths,
      const Color.fromARGB(255, 137, 158, 197)),
  "gaz": ItemModel(AppIcon.gaz,
      const Color.fromARGB(255, 113, 193, 225)),
};
