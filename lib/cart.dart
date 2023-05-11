import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          final cart = value.cart;
          return ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(cart[index].productName.toString()),
                    subtitle: Text(cart[index].productdetail.toString()),
                    trailing: IconButton(
                      onPressed: () {
                        value.removeFromCart(cart[index]);
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
