import 'package:bai5/utils/constant.dart';
import 'package:bai5/widget/item_widget.dart';
import 'package:bai5/screen/cart_screen.dart';
import 'package:bai5/data/item_list.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
        centerTitle: true,
        backgroundColor: primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const CartScreen()));
              },
              icon: const Icon(Icons.shopping_cart)),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: itemList[index]);
          }),
    );
  }
}
