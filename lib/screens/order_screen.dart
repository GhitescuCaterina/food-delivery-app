import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model.dart';
import 'navigation_helper.dart'; // Import the navigation helper

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  OrderDetailsScreen({required this.order});

  void _orderAgain(BuildContext context) {
    for (var item in order.items) {
      Cart.addItem(item);
    }

    final snackBar = SnackBar(
      content: Text('Items added to cart!'),
      action: SnackBarAction(
        label: 'View Cart',
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
          navigateToCart(context);
        },
      ),
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
            SizedBox(height: 10),
            Text(
              'Order #${order.name.toUpperCase().substring(0, 6)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ...order.items.map((item) => ListTile(
                  title: Text('${item.quantity} x ${item.name}'),
                  trailing: Text('${item.price.toStringAsFixed(2)} lei'),
                )),
            Divider(),
            Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('${order.price.toStringAsFixed(2)} lei',
                style: TextStyle(fontSize: 18)),
            Spacer(),
            ElevatedButton(
              onPressed: () => _orderAgain(context),
              child: Text('Order Again'),
            )
          ],
        ),
      ),
    );
  }
}
