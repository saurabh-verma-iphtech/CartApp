import 'package:favourite_app/provider/cart_provider.dart';
import 'package:favourite_app/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:favourite_app/screens/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Product",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()),
                      );
                    },
                    child: badges.Badge(
                      badgeContent: Text(
                        cartProvider.cartCount.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      badgeAnimation: const badges.BadgeAnimation.scale(
                        animationDuration: Duration(milliseconds: 300),
                      ),
                      child:
                          const Icon(Icons.shopping_cart, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: productProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];

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
                    subtitle: Text(
                        "\$${product.price?.toStringAsFixed(2) ?? '0.00'}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addToCart(product); // Add to cart
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
