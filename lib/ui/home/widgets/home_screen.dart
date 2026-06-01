import 'package:curso_mvvm_youtube/config/dependencies.dart';
import 'package:curso_mvvm_youtube/routing/routes.dart';
import 'package:curso_mvvm_youtube/ui/cart/viewmodels/cart_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/product/widgets/products_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  final CartViewmodel cartViewModel;
  const HomeScreen({super.key, required this.cartViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos"),
        actions: [
          ListenableBuilder(
            listenable: cartViewModel,
            builder: (context, child) {
              return IconButton(
                onPressed: () {
                  context.push(Routes.cart);
                },
                icon: Badge.count(
                  count: cartViewModel.items.length,
                  child: Icon(Icons.shopping_cart),
                ),
              );
            },
          ),
        ],
      ),
      body: ProductsWidget(
        productViewmodel: getIt(),
        cartViewmodel: cartViewModel,
      ),
    );
  }
}
