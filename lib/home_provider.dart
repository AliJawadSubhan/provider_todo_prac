import 'package:flutter/foundation.dart';
import 'package:provi_api/model/cart.dart';
import 'package:provi_api/model/product.dart';

class HomeProvider with ChangeNotifier {
  final List<Products> _products = [
    Products(
      productName: 'Camera',
      productdetail:
          'This camera is very cool and superior to anything in this world',
    ),
    Products(
      productName: 'Headphones',
      productdetail:
          'These headphones provide exceptional sound quality and comfort.',
    ),
    Products(
      productName: 'Smartphone',
      productdetail:
          'This smartphone has a powerful processor and an excellent camera.',
    ),
    Products(
      productName: 'Laptop',
      productdetail: 'This laptop offers high performance and a sleek design.',
    ),
    Products(
      productName: 'Smart Watch',
      productdetail:
          'This smartwatch tracks your fitness and allows you to receive notifications on your wrist.',
    ),
    Products(
      productName: 'Wireless Speakers',
      productdetail:
          'These wireless speakers deliver rich audio and have a long battery life.',
    ),
    Products(
      productName: 'Gaming Console',
      productdetail:
          'This gaming console provides an immersive gaming experience with realistic graphics.',
    ),
  ];

  List<Products> get products => _products;
  final List<Products> _cart = [];
  List<Products> get cart => _cart;

  bool isInCart = false;
  addToCart(Products product) {
    isInCart = true;
    notifyListeners();
    if (!_cart.contains(products)) _cart.add(product);
  }

  bool checkIsInCart(Products products) {
    if (_cart.contains(products)) {
      return true;
    }
    return false;
  }

  removeFromCart(Products products) {
    isInCart = false;
    notifyListeners();
    if (_cart.contains(products)) _cart.remove(products);
  }
}
