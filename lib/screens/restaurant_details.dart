import 'package:flutter/material.dart';
import 'model.dart';

class RestaurantDetails extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<Map<String, dynamic>> menu;
  final String hours;
  final double rating;
  final bool isFavorite;
  final ValueChanged<bool> onFavoriteChanged;

  const RestaurantDetails({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.menu,
    required this.hours,
    required this.rating,
    required this.isFavorite,
    required this.onFavoriteChanged,
  });

  void _addToCart(BuildContext context, Map<String, dynamic> item) {
    Cart.addItem(
      OrderItem(name: item['name'], price: item['price'], quantity: 1),
      title,
    );

    const snackBar = SnackBar(
      content: Text('Item added to cart!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.yellow : Colors.white,
            ),
            onPressed: () {
              onFavoriteChanged(!isFavorite);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.asset(
            'lib/images/$imagePath',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Hours: $hours',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    Text(
                      '$rating',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ...menu.map((item) => ListTile(
                      title: Text(item['name']),
                      trailing: Text('${item['price']} lei'),
                      onTap: () => _addToCart(context, item),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
