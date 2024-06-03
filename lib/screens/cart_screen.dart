import 'package:flutter/material.dart';
import 'model.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: Cart.items.length,
        itemBuilder: (context, index) {
          final item = Cart.items[index];
          return ListTile(
            title: Text('${item.quantity} x ${item.name}'),
            trailing: Text('${item.price.toStringAsFixed(2)} lei'),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to checkout screen or perform checkout action
          },
          child: Text('Checkout'),
        ),
      ),
    );
  }
}