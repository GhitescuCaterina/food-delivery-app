import 'package:flutter/material.dart';

class FoodAndMoreScreen extends StatelessWidget {
  const FoodAndMoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food & More'),
      ),
      body: ListView(
        children: [
          _buildItem(
              'Restaurant 1', 'Descriere restaurant 1', 'restaurant1.png'),
          _buildItem(
              'Restaurant 2', 'Descriere restaurant 2', 'restaurant2.png'),
          _buildItem(
              'Restaurant 3', 'Descriere restaurant 3', 'restaurant3.png'),
          // Adaugă mai multe elemente aici, după necesități
        ],
      ),
    );
  }

  Widget _buildItem(String title, String description, String imagePath) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'lib/images/$imagePath',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
