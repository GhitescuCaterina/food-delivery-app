import 'package:flutter/material.dart';
import 'dart:math';
import 'restaurant_details.dart';

class MeniulZileiScreen extends StatelessWidget {
  final ValueChanged<String?> onOptionChanged;
  final String selectedOption;
  final List<Map<String, dynamic>> restaurants;

  const MeniulZileiScreen({
    super.key,
    required this.onOptionChanged,
    required this.selectedOption,
    required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final restaurant = restaurants[random.nextInt(restaurants.length)];
    final recommendedDish = restaurant['menu'][random.nextInt(restaurant['menu'].length)];

    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: selectedOption,
          icon: const Icon(Icons.arrow_downward, color: Colors.black),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(
              color: Colors.white, fontSize: 20),
          dropdownColor: Colors.amber[800],
          underline: Container(height: 0),
          onChanged: (String? newValue) {
            onOptionChanged(newValue);
          },
          items: <String>['Food & More', 'Restaurante Favorite', 'Meniul Zilei']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                    color:
                        Colors.black),
              ),
            );
          }).toList(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestaurantDetails(
                      title: restaurant['title'],
                      description: restaurant['description'],
                      imagePath: restaurant['imagePath'],
                      menu: restaurant['menu'],
                      hours: restaurant['hours'],
                      rating: restaurant['rating'],
                      isFavorite: false,
                      onFavoriteChanged: (isFavorite) {},
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'lib/images/${restaurant['imagePath']}',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Meniul Zilei',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Restaurant recomandat: ${restaurant['title']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Descriere: ${restaurant['description']}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Recomandarea noastră: ${recommendedDish['name']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Preț: ${recommendedDish['price']} lei',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
