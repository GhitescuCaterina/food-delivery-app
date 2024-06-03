import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  const OrderDetailsScreen({super.key, required this.order});

  void _orderAgain(BuildContext context) {
    for (var item in order.items) {
      Cart.addItem(item, order.name);
    }

    const snackBar = SnackBar(
      content: Text('Items added to cart!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(order.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Delivered ${DateFormat('dd MMM, yyyy HH:mm').format(order.date)}',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 10),
            Text(
              'Order #${order.name.toUpperCase().substring(0, 6)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ...order.items.map((item) => ListTile(
                  title: Text('${item.quantity} x ${item.name}'),
                  trailing: Text('${item.price.toStringAsFixed(2)} lei'),
                )),
            const Divider(),
            const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('${order.price.toStringAsFixed(2)} lei',
                style: const TextStyle(fontSize: 18)),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _orderAgain(context),
              child: const Text('Order Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 206, 168),
                foregroundColor: Colors.amber[900],
              ),
            )
          ],
        ),
      ),
    );
  }
}
