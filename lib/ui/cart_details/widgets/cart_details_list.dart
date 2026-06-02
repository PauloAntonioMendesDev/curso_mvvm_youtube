import 'package:curso_mvvm_youtube/ui/cart_details/viewmodels/cart_details_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/cart_details/widgets/cart_details_item_card.dart';
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
        return SafeArea(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: viewmodel.items.length,
                    itemBuilder: (context, index) => CartDetailsItemCard(
                      cartItem: viewmodel.items[index],
                      viewModel: viewmodel,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(width: 1)),
                  ),
                ),

                Column(
                  spacing: 8,
                  children: [
                    SizedBox(width: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal", style: TextStyle(fontSize: 20)),
                        Text("R\$ 634,00", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Frete", style: TextStyle(fontSize: 20)),
                        Text("R\$ 0,00", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "R\$ 634,00",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(16),
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "FINALIZAR COMPRA",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
