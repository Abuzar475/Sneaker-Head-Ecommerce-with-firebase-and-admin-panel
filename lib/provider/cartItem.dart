import 'package:flutter/cupertino.dart';
import 'package:sneaker_head/Models/Product.dart';

class CartItem extends ChangeNotifier {
  List<Product> products = [];

  addProduct(Product product) {
    products.add(product);
    print("[CartItem] inside addProduct() ${product.pName}");
    print("[CartItem] inside addProduct() ${products.length}");
    notifyListeners();
  }

  deleteProduct(Product product) {
    products.remove(product);
    notifyListeners();
  }
}
