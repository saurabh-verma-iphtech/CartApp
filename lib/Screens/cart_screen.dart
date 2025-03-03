import 'package:favourite_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),

      
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          // Checking if the cart is empty
          if (cartProvider.cartItems.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          // If there are items in the cart
          return ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              final product = cartProvider.cartItems[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Image.network(
                    product.image ?? '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.title ?? 'No Title'),
                  subtitle:
                      Text("\$${product.price?.toStringAsFixed(2) ?? '0.00'}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () {
                      cartProvider.removeFromCart(product); // Remove item
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          // Only show bottom bar if there are items in the cart
          return cartProvider.cartItems.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Display the total price
                      Text(
                        "Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.all(15),
                        ),
                        onPressed: () {
                          // Handle checkout logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Proceeding to checkout...")),
                          );
                        },
                        child: const Text("Checkout",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
