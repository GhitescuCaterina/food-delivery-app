import 'package:flutter/material.dart';

class FavoriteRestaurantsScreen extends StatefulWidget {
  final ValueChanged<String?> onOptionChanged;
  final String selectedOption;

  const FavoriteRestaurantsScreen(
      {Key? key, required this.onOptionChanged, required this.selectedOption})
      : super(key: key);

  @override
  _FavoriteRestaurantsScreenState createState() =>
      _FavoriteRestaurantsScreenState();
}

class _FavoriteRestaurantsScreenState extends State<FavoriteRestaurantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: widget.selectedOption,
          icon: const Icon(Icons.arrow_downward, color: Colors.black),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          dropdownColor: Colors.amber[800],
          underline: Container(height: 0), // Remove underline
          onChanged: (String? newValue) {
            widget.onOptionChanged(newValue);
          },
          items: <String>['Food & More', 'Restaurante Favorite', 'Meniul Zilei']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                    color:
                        Colors.black), // Set the color for dropdown items here
              ),
            );
          }).toList(),
        ),
      ),
      body: ListView(
        children: [
          _buildItem('Favorite Restaurant 1', 'Descriere restaurant favorit 1',
              'restaurant1.png'),
          _buildItem('Favorite Restaurant 2', 'Descriere restaurant favorit 2',
              'restaurant2.png'),
          _buildItem('Favorite Restaurant 3', 'Descriere restaurant favorit 3',
              'restaurant3.png'),
          // Adaugă mai multe elemente aici, după necesități
        ],
      ),
    );
  }

  Widget _buildItem(String title, String description, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
