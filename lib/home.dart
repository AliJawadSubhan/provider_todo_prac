import 'package:flutter/material.dart';
import 'package:provi_api/cart.dart';
import 'package:provi_api/home_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          final products = value.products;
          return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(products[index].productName.toString()),
                    subtitle: Text(products[index].productdetail.toString()),
                    trailing: IconButton(
                        onPressed: () {
                          if (value.checkIsInCart(products[index])) {
                            value.removeFromCart(products[index]);
                          } else {
                            value.addToCart(products[index]);
                          }
                        },
                        icon: Icon(
                          Icons.shop,
                          color: value.checkIsInCart(products[index])
                              ? Colors.black
                              : Colors.amber,
                        )),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return CartScreen();
          }));
        },
        child: Text(Provider.of<HomeProvider>(context).cart.length.toString()),
      ),
    );
  }
}
