import 'package:curso_mvvm_youtube/domain/models/cart_item.dart';
import 'package:curso_mvvm_youtube/domain/models/product.dart';
import 'package:curso_mvvm_youtube/utils/result.dart';
import 'package:flutter/material.dart';

abstract class CartRepository extends ChangeNotifier {
  List<CartItem> get items;
  void addProductToCart(Product product);
  bool isProductInCart(Product product);
  Future<Result<List<CartItem>>> fetchItems();
  void reduceItemQuantity(CartItem item);
  void increaseItemQuantity(CartItem item);
}
