import 'package:curso_mvvm_youtube/data/repositories/cart/cart_repository.dart';
import 'package:curso_mvvm_youtube/domain/models/cart_item.dart';
import 'package:curso_mvvm_youtube/utils/command.dart';
import 'package:curso_mvvm_youtube/utils/result.dart';
import 'package:flutter/material.dart';

class CartDetailsViewmodel extends ChangeNotifier {
  final CartRepository _cartRepository;

  CartDetailsViewmodel({required CartRepository cartRepository})
    : _cartRepository = cartRepository {
    _cartRepository.addListener(() {
      _items = _cartRepository.items;
    });
  }

  List<CartItem> get items => _items;
  List<CartItem> _items = [];

  late final load = Command0(_load);

  Future<Result<List<CartItem>>> _load() async {
    return await _cartRepository.fetchItems();
  }

  void reduceItemQuantity(CartItem item) {
    _cartRepository.reduceItemQuantity(item);
    notifyListeners();
  }

  void increaseItemQuantity(CartItem item) {
    _cartRepository.increaseItemQuantity(item);
    notifyListeners();
  }
}
