import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyCartDetails extends StatelessWidget {
  const EmptyCartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 226, 223, 223),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.remove_shopping_cart, size: 60),
          ),
          Text(
            "Nenhum produto adicionado ",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "no Carrinho",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: context.pop,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "CONTINUAR COMPRANDO",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
