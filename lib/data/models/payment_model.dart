import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/constants/icon.dart';

class HistoryModel {
  final String? name;
  final String? ccp;
  final int? amount;
  final Timestamp? time;
  final String? item;

  HistoryModel({
    this.ccp,
    this.name,
    this.amount,
    this.time,
    this.item,
  });
}

class ItemModel {
  final IconData icon;
  final Color color;

  ItemModel(
    this.icon,
    this.color,
  );
}

Map<String, ItemModel> itemModel = {
  "SuperMarket": ItemModel(AppIcon.shoping,
      const Color.fromARGB(255, 207, 82, 73)),
  "food": ItemModel(AppIcon.food,
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
