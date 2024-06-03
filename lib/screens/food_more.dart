import 'package:flutter/material.dart';
import 'restaurant_details.dart';

class FoodAndMoreScreen extends StatefulWidget {
  final ValueChanged<String?> onOptionChanged;
  final String selectedOption;
  final List<Map<String, dynamic>> favoriteRestaurants;
  final ValueChanged<Map<String, dynamic>> onFavoriteChanged;

  const FoodAndMoreScreen({
    Key? key,
    required this.onOptionChanged,
    required this.selectedOption,
    required this.favoriteRestaurants,
    required this.onFavoriteChanged,
  }) : super(key: key);

  @override
  _FoodAndMoreScreenState createState() => _FoodAndMoreScreenState();
}

class _FoodAndMoreScreenState extends State<FoodAndMoreScreen> {
  final List<Map<String, dynamic>> _restaurants = [
    {
      'title': 'Oscar',
      'description':
          'Restaurant Oscar – locul în care lași în urmă agitația zilnică și te bucuri de momente îndelungate de răsfăț.',
      'imagePath': 'restaurant1.png',
      'menu': [
        {'name': 'Pizza', 'price': 25.0},
        {'name': 'Pasta', 'price': 30.0},
        {'name': 'Salad', 'price': 20.0},
      ],
      'hours': '10:00 - 22:00',
      'rating': 4.5,
    },
    {
      'title': 'McDonalds',
      'description':
          'McDonalds is an American multinational fast food chain, founded in 1940 as a restaurant',
      'imagePath': 'restaurant2.png',
      'menu': [
        {'name': 'Burger Big Mac', 'price': 15.0},
        {'name': 'Chicken Nuggets', 'price': 20.0},
        {'name': 'Meniu Big Mac', 'price': 24.0},
        {'name': 'Small fries', 'price': 10.0},
        {'name': 'Small Coke', 'price': 5.0},
        {'name': 'McFlurry', 'price': 12.0},
        {'name': 'Strudel', 'price': 10.0}
      ],
      'hours': '09:00 - 24:00',
      'rating': 4.0,
    },
    {
      'title': 'Sushi House',
      'description':
          'Bucura-te de gustul autentic al bucatariei japoneze preparat cu ingrediente de calitate.',
      'imagePath': 'restaurant3.png',
      'menu': [
        {'name': 'Sushi Roll', 'price': 35.0},
        {'name': 'Tempura', 'price': 40.0},
        {'name': 'Miso Soup', 'price': 15.0},
      ],
      'hours': '12:00 - 23:00',
      'rating': 4.7,
    },
    {
      'title': 'Sushi Master',
      'description':
          'Complexitate și rafinament în restaurantul nostru din centrul orașului!',
      'imagePath': 'restaurant4.png',
      'menu': [
        {'name': 'Sashimi', 'price': 45.0},
        {'name': 'Nigiri', 'price': 35.0},
        {'name': 'Udon', 'price': 25.0},
      ],
      'hours': '11:00 - 22:00',
      'rating': 4.6,
    },
    {
      'title': 'eten & drinken',
      'description':
          'O cafenea din Iasi cu bubble tea, brunch si produse de patiserie.',
      'imagePath': 'cafenea1.png',
      'menu': [
        {'name': 'Bubble Tea', 'price': 15.0},
        {'name': 'Brunch', 'price': 40.0},
        {'name': 'Patiserie', 'price': 20.0},
      ],
      'hours': '08:00 - 20:00',
      'rating': 4.8,
    },
    {
      'title': 'Restaurant la Mama',
      'description':
          'La Mama este o interpretare moderna a bucatariei romanesti.',
      'imagePath': 'order3.png',
      'menu': [
        {'name': 'Ciorba de burta', 'price': 20.0},
        {'name': 'Sarmale', 'price': 30.0},
        {'name': 'Mici', 'price': 25.0},
      ],
      'hours': '10:00 - 22:00',
      'rating': 4.3,
    },
    {
      'title': 'Kaufland',
      'description':
          'Valorile companiei noastre sunt principii de ghidare care își pun amprenta asupra comportamentului nostru.',
      'imagePath': 'magazin1.png',
      'menu': [
        {'name': 'Apples', 'price': 5.0},
        {'name': 'Bananas', 'price': 4.0},
        {'name': 'Bread', 'price': 2.0},
      ],
      'hours': '08:00 - 22:00',
      'rating': 4.2,
    },
    {
      'title': 'Mega Image',
      'description':
          'Ghidați zilnic de valorile pe care le împărtășim: integritate, curaj, muncă în echipă, grijă și umor.',
      'imagePath': 'magazin2.png',
      'menu': [
        {'name': 'Milk', 'price': 5.0},
        {'name': 'Eggs', 'price': 10.0},
        {'name': 'Cheese', 'price': 20.0},
      ],
      'hours': '08:00 - 22:00',
      'rating': 4.1,
    },
    {
      'title': 'Altceva',
      'description':
          'Comandă mâncare street food pentru toate gusturile, de la burgeri, crispy, până la aripioare și shaorma.',
      'imagePath': 'altceva.png',
      'menu': [
        {'name': 'Pizza Polo', 'price': 30.50},
        {'name': 'Chicken Crispy', 'price': 20.0},
        {'name': 'Shaorma', 'price': 25.0},
        {'name': 'Sour cream with garlic', 'price': 10.0},
      ],
      'hours': '10:00 - 22:00',
      'rating': 4.0,
    },
    {
      'title': 'Pizza Hut',
      'description':
          'Știm câtă nerăbdare se ascunde în așteptarea pizzei preferate.',
      'imagePath': 'pizzahut.png',
      'menu': [
        {'name': 'Pizza margherita', 'price': 35.0},
        {'name': 'Pasta Tonno', 'price': 35.0},
        {'name': 'Caesar Salad', 'price': 25.0},
        {'name': 'Coca Cola', 'price': 8.0},
      ],
      'hours': '10:00 - 23:00',
      'rating': 4.4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: widget.selectedOption,
          icon: const Icon(Icons.arrow_downward, color: Colors.black),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(
              color: Colors.white, fontSize: 20), // Set the color here
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
      body: ListView.builder(
        itemCount: _restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = _restaurants[index];
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
                    isFavorite: widget.favoriteRestaurants
                        .any((fav) => fav['title'] == restaurant['title']),
                    onFavoriteChanged: (isFavorite) {
                      if (isFavorite) {
                        widget.onFavoriteChanged(restaurant);
                      } else {
                        widget.onFavoriteChanged(
                            {'title': restaurant['title'], 'remove': true});
                      }
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
