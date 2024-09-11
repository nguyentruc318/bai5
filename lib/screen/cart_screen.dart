import 'package:bai5/provider/cart_provider.dart';
import 'package:bai5/utils/constant.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 2"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Consumer<CartProvider>(
            builder: (context, provider, child) => Expanded(
              child: ListView.builder(
                itemCount: provider.cartItem.length,
                itemBuilder: (context, index) {
                  final item = provider.cartItem[index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2, color: Colors.black)),
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text("\$${item.price}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              provider.removeItem(item);
                            },
                          ),
                          Text('${item.quantity}'), // Hiển thị số lượng
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              provider.addItem(item);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ElevatedButton(
              onPressed: Provider.of<CartProvider>(context).reset,
              child: const Text("reset")),
        ],
      ),
      // Consumer<CartProvider>(
      //   builder: (context, provider, child) => Column(
      //     children: [
      //       Expanded(
      //         child: ListView.builder(
      //           itemCount: provider.cartItem.length,
      //           itemBuilder: (context, index) {
      //             return ItemWidget(item: provider.cartItem[index]);
      //           },
      //         ),
      //       ),
      //       ElevatedButton(
      //           onPressed: provider.reset, child: const Text("reset")),
      //     ],
      //   ),
      // ),
    );
  }
}
