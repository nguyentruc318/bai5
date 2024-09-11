import 'package:bai5/model/item_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<ItemModel> cartItem = [];
  // UnmodifiableListView get cartItems => UnmodifiableListView(_cartItem);

  void addItem(ItemModel item) {
    if (!cartItem.contains(item)) {
      cartItem.add(item);
      item.quantity = 1;
    } else {
      item.quantity++;
    }
    notifyListeners();
  }

  void setQuantity(ItemModel item, int quantity) {
    if (cartItem.contains(item)) {
      if (quantity <= 0) {
        cartItem.remove(item);
      } else {
        item.quantity = quantity;
      }
      notifyListeners();
    }
  }

  void removeItem(ItemModel item) {
    if (item.quantity >= 1) {
      item.quantity--;
    }
    if (item.quantity == 0) {
      cartItem.removeWhere((itemInCart) => itemInCart == item);
    }
    notifyListeners();
  }

  void reset() {
    cartItem.clear();
    notifyListeners();
  }

  int getItemQuantity(ItemModel item) {
    return item.quantity;
  }
}
