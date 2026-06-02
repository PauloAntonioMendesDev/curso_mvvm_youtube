import 'package:curso_mvvm_youtube/ui/cart_details/viewmodels/cart_details_viewmodel.dart';
import 'package:curso_mvvm_youtube/ui/cart_details/widgets/cart_details_list.dart';
import 'package:flutter/material.dart';

class CartDetailsScreen extends StatefulWidget {
  final CartDetailsViewmodel viewModel;
  const CartDetailsScreen({super.key, required this.viewModel});

  @override
  State<CartDetailsScreen> createState() => _CartDetailsScreenState();
}

class _CartDetailsScreenState extends State<CartDetailsScreen> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget.viewModel.load.execute();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Itens no carrinho")),
      body: ListenableBuilder(
        listenable: widget.viewModel.load,
        builder: (context, child) {
          final command = widget.viewModel.load;
          if (command.running) {
            return Center(child: CircularProgressIndicator());
          }
          if (command.error) {
            return Center(child: Text("Ocorreu um erro ao carregar carrinho."));
          }
          return child!;
        },
        child: CartDetailsList(viewmodel: widget.viewModel),
      ),
    );
  }
}
