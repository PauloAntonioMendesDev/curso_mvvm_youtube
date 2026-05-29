import 'package:curso_mvvm_youtube/data/repositories/cart/cart_repository.dart';
import 'package:curso_mvvm_youtube/domain/models/cart_item.dart';
import 'package:curso_mvvm_youtube/domain/models/product.dart';
import 'package:curso_mvvm_youtube/utils/result.dart';
import 'package:flutter/material.dart';

class CartRepositoryLocal extends ChangeNotifier implements CartRepository {
  @override
  void addProductToCart(Product product) {
    for (int i = 0; i < _items.length; i++) {
      if (isProductInCart(product)) {
        _items[i].productCount++;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(product: product, productCount: 1));
    notifyListeners();
  }

  @override
  Future<Result<List<CartItem>>> fetchItems() async {
    try {
      return Result.ok(_items);
    } finally {
      notifyListeners();
    }
  }

  @override
  bool isProductInCart(Product product) {
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].product.id == product.id) {
        return true;
      }
    }
    return false;
  }

  @override
  List<CartItem> get items => _items;

  final List<CartItem> _items = [];

  @override
  void reduceItemQuantity(CartItem item) {
    final cartItem = _items.where((e) => e.product.id == item.product.id).first;

    if (cartItem.productCount == 1) {
      _items.removeWhere(((e) => e.product.id == item.product.id));
    } else {
      final index = _items.indexWhere((e) => e.product.id == item.product.id);
      _items[index].productCount--;
    }

    notifyListeners();
  }

  @override
  void increaseItemQuantity(CartItem item) {
    final index = _items.indexWhere((e) => e.product.id == item.product.id);

    _items[index].productCount++;
    notifyListeners();
  }
}
