import 'package:flutter/material.dart';

class CartItem {
  final String flavor;
  final String price;
  final Color color;
  final String image;
  final String brand;

  CartItem({
    required this.flavor,
    required this.price,
    required this.color,
    required this.image,
    required this.brand,
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners(); // avisa a los widgets que el carrito cambió
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + double.parse(item.price));
  }
}