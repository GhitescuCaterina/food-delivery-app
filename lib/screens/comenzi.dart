// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model.dart';
import 'order_screen.dart';

class Comenzi extends StatefulWidget {
  const Comenzi({super.key});

  @override
  _ComenziState createState() => _ComenziState();
}

class _ComenziState extends State<Comenzi> {
  List<Order> pastOrders = [
    Order(
        imageUrl: 'lib/images/order1.png',
        name: 'Altceva',
        price: 40.50,
        date: DateTime(2024, 6, 1, 21, 59),
        status: 'Delivered',
        items: [
          OrderItem(name: 'Pizza pollo', price: 30.50, quantity: 1),
          OrderItem(name: 'Sour cream with garlic', price: 10.00, quantity: 1),
        ]),
    Order(
        imageUrl: 'lib/images/order2.png',
        name: 'Pizza Hut',
        price: 43.00,
        date: DateTime(2024, 6, 2, 19, 30),
        status: 'Delivered',
        items: [
          OrderItem(name: 'Pizza margherita', price: 35.00, quantity: 1),
          OrderItem(name: 'Coca-Cola', price: 8.00, quantity: 2),
        ]),
    Order(
        imageUrl: 'lib/images/order3.png',
        name: 'Restaurant la Mama',
        price: 38.98,
        date: DateTime(2024, 6, 3, 12, 45),
        status: 'Delivered',
        items: [
          OrderItem(name: 'Sarmale', price: 22.99, quantity: 1),
          OrderItem(name: 'Ciorba Radauteana', price: 15.99, quantity: 1),
        ]),
    Order(
        imageUrl: 'lib/images/order4.png',
        name: 'McDonalds',
        price: 34.00,
        date: DateTime(2024, 6, 4, 18, 15),
        status: 'Delivered',
        items: [
          OrderItem(name: 'Meniu Big Mac', price: 24.00, quantity: 1),
          OrderItem(name: 'Strudel', price: 10.00, quantity: 1),
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comenzile tale')),
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
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  final Order order;

  const OrderItemWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(order.imageUrl,
                width: 80, height: 80, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('${order.price.toStringAsFixed(2)} lei',
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                  Text(
                      '${DateFormat('dd MMM, yyyy HH:mm').format(order.date)} ${order.status}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.replay),
            onPressed: () {
              for (var item in order.items) {
                Cart.addItem(item, order.name);
              }

              const snackBar = SnackBar(
                content: Text('Items added to cart!'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );
  }
}
