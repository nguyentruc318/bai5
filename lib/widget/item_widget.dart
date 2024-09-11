import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bai5/model/item_model.dart';
import 'package:bai5/provider/cart_provider.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, child) {
        return ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          title: Text(item.name),
          subtitle: Text('Quantity in cart: ${provider.getItemQuantity(item)}'),
          trailing: ElevatedButton(
            onPressed: () => provider.addItem(item),
            child: const Text("Add to cart"),
          ),
        );
      },
    );
  }
}
