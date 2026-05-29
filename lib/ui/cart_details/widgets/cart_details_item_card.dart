import 'package:curso_mvvm_youtube/domain/models/cart_item.dart';
import 'package:curso_mvvm_youtube/ui/cart_details/viewmodels/cart_details_viewmodel.dart';
import 'package:flutter/material.dart';

class CartDetailsItemCard extends StatelessWidget {
  final CartDetailsViewmodel viewModel;
  final CartItem cartItem;
  const CartDetailsItemCard({
    super.key,
    required this.cartItem,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        color: Colors.white70,
      ),
      child: Row(
        children: [
          Column(
            children: [
              Image.network(
                cartItem.product.thumbnail!,
                height: 200,
                width: 100,
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        cartItem.product.title!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        cartItem.product.description!,
                        style: TextStyle(fontSize: 18),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "R\$ ${cartItem.product.price!.toStringAsFixed(2).replaceAll(".", ",")}",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 212, 205, 203),
                          border: Border.all(
                            width: 0.5,
                            color: const Color.fromARGB(255, 119, 108, 104),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                viewModel.reduceItemQuantity(cartItem);
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              cartItem.productCount.toString(),
                              style: TextStyle(fontSize: 24),
                            ),
                            IconButton(
                              onPressed: () {
                                viewModel.increaseItemQuantity(cartItem);
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
