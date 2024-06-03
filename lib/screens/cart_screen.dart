import 'package:flutter/material.dart';
import 'model.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  void _removeItem(int index) {
    setState(() {
      Cart.items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cosul tau (${Cart.items.length} produse)'),
      ),
      body: ListView.builder(
        itemCount: Cart.items.length,
        itemBuilder: (context, index) {
          final item = Cart.items[index];
          return ListTile(
            title: Text('${item.quantity} x ${item.name}'),
            subtitle: Text('De la: ${item.location}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${item.price.toStringAsFixed(2)} lei'),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _removeItem(index),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 255, 213, 157),
            foregroundColor: Colors.amber[900],
          ),
          child: const Text('Comanda!'),
        ),
      ),
    );
  }
}
