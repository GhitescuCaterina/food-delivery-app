import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model.dart';  // Import the shared model
import 'order_screen.dart'; // Import the file with OrderDetailsScreen

class Comenzi extends StatefulWidget {
  @override
  _ComenziState createState() => _ComenziState();
}

class _ComenziState extends State<Comenzi> {
  List<Order> pastOrders = [
    Order(
      imageUrl: 'lib/images/order1.png',
      name: 'Altceva',
      price: 33.59,
      date: DateTime(2024, 6, 1, 21, 59),
      status: 'Delivered',
      items: [
        OrderItem(name: 'Pizza pollo', price: 20.50, quantity: 1),
        OrderItem(name: 'Sour cream with garlic', price: 5.00, quantity: 1),
      ]
    ),
    Order(
      imageUrl: 'lib/images/order2.png',
      name: 'Pizza Hut',
      price: 45.99,
      date: DateTime(2024, 6, 2, 19, 30),
      status: 'Delivered',
      items: [
        OrderItem(name: 'Pizza margherita', price: 25.00, quantity: 1),
        OrderItem(name: 'Coca-Cola', price: 5.00, quantity: 2),
      ]
    ),
    Order(
      imageUrl: 'lib/images/order3.png',
      name: 'Restaurant la Mama',
      price: 22.99,
      date: DateTime(2024, 6, 3, 12, 45),
      status: 'Delivered',
      items: [
        OrderItem(name: 'Sarmale', price: 15.00, quantity: 1),
        OrderItem(name: 'Ciorba Radauteana', price: 5.00, quantity: 1),
      ]
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comenzile tale')),
      body: ListView.separated(
        itemCount: pastOrders.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      OrderDetailsScreen(order: pastOrders[index]))),
          child: OrderItemWidget(order: pastOrders[index]),
        ),
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  final Order order;

  OrderItemWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(order.imageUrl,
                width: 80, height: 80, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('${order.price.toStringAsFixed(2)} lei',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  Text(
                      DateFormat('dd MMM, yyyy HH:mm').format(order.date) +
                          ' ' +
                          order.status,
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.replay),
            onPressed: () {
              // Implement repeat order action
            },
          ),
        ],
      ),
    );
  }
}
