import 'package:bai5/provider/cart_provider.dart';
import 'package:bai5/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
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
      subtitle: Text(item.price.toString()),
      trailing: ElevatedButton(
          onPressed: () => provider.addItem(item), child: const Text("add")),
    );
  }
}
