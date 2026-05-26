import 'package:curso_mvvm_youtube/ui/cart_details/viewmodels/cart_details_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/cart_details/widgets/empty_cart_details.dart';
import 'package:flutter/material.dart';

class CartDetailsList extends StatelessWidget {
  final CartDetailsViewmodel viewmodel;
  const CartDetailsList({super.key, required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewmodel,
      builder: (context, child) {
        if (viewmodel.items.isEmpty) {
          return EmptyCartDetails();
        }
        return Text("Carrinho carregado!");
      },
    );
  }
}
