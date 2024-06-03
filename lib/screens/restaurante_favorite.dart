import 'package:flutter/material.dart';
import 'restaurant_details.dart';

class FavoriteRestaurantsScreen extends StatelessWidget {
  final ValueChanged<String?> onOptionChanged;
  final String selectedOption;
  final List<Map<String, dynamic>> favoriteRestaurants;
  final ValueChanged<Map<String, dynamic>> onFavoriteChanged;

  const FavoriteRestaurantsScreen({
    Key? key,
    required this.onOptionChanged,
    required this.selectedOption,
    required this.favoriteRestaurants,
    required this.onFavoriteChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: selectedOption,
          icon: const Icon(Icons.arrow_downward, color: Colors.black),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.white, fontSize: 20),
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
      body: ListView.builder(
        itemCount: favoriteRestaurants.length,
        itemBuilder: (context, index) {
          final restaurant = favoriteRestaurants[index];
          return GestureDetector(
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
                    isFavorite: true,
                    onFavoriteChanged: (isFavorite) {
                      onFavoriteChanged({
                        'title': restaurant['title'],
                        'remove': !isFavorite,
                      });
                    },
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'lib/images/${restaurant['imagePath']}',
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
                          restaurant['title'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          restaurant['description'],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
