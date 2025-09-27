import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: cart.items.isEmpty
          ? const Center(child: Text("The Cart is Empty"))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ListTile(
                        leading: Image.asset(item.image, height: 40),
                        title: Text(item.flavor),
                        subtitle: Text("\$${item.price} - ${item.brand}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cart.removeItem(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Total: \$${cart.totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          cart.clearCart();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Purchase made!")),
                          );
                        },
                        child: const Text("Pay"),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
