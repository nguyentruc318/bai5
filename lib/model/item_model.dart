import 'package:flutter/material.dart';

class ItemModel extends ChangeNotifier {
  final String name;
  final double price;
  final Color color;
  int quantity;

  ItemModel(
      {required this.name,
      required this.price,
      required this.color,
      this.quantity = 0});
}
