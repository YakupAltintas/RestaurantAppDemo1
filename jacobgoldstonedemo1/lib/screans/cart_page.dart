import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      leading: Row(
        children: [
          const SizedBox(width: 5),
          IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      actions: const [Text("Bir ürün")],
    ));
  }
}
