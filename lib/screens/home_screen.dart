import 'package:flutter/material.dart';
import 'comenzi.dart';
import 'order_screen.dart';
import 'model.dart';
import 'cart_screen.dart';
import 'cont_screen.dart';
import 'food_more.dart';
import 'restaurante_favorite.dart';
import 'meniul_zilei.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _selectedOption = 'Food & More';
  List<Map<String, dynamic>> _favoriteRestaurants = [];

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

  late List<Widget> _homePageOptions;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _homePageOptions = <Widget>[
      FoodAndMoreScreen(
        onOptionChanged: _onDropdownChanged,
        selectedOption: _selectedOption,
        favoriteRestaurants: _favoriteRestaurants,
        onFavoriteChanged: _onFavoriteChanged,
      ),
      FavoriteRestaurantsScreen(
        onOptionChanged: _onDropdownChanged,
        selectedOption: _selectedOption,
        favoriteRestaurants: _favoriteRestaurants,
        onFavoriteChanged: _onFavoriteChanged,
      ),
      MeniulZileiScreen(
        onOptionChanged: _onDropdownChanged,
        selectedOption: _selectedOption,
        restaurants: _restaurants,
      ),
    ];

    _widgetOptions = <Widget>[
      HomePageContent(
        onDropdownChanged: _onDropdownChanged,
      ),
      CartScreen(),
      Comenzi(),
      ContScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateToCart() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  void _onDropdownChanged(String? newValue) {
    setState(() {
      _selectedOption = newValue!;
      _homePageOptions = <Widget>[
        FoodAndMoreScreen(
          onOptionChanged: _onDropdownChanged,
          selectedOption: _selectedOption,
          favoriteRestaurants: _favoriteRestaurants,
          onFavoriteChanged: _onFavoriteChanged,
        ),
        FavoriteRestaurantsScreen(
          onOptionChanged: _onDropdownChanged,
          selectedOption: _selectedOption,
          favoriteRestaurants: _favoriteRestaurants,
          onFavoriteChanged: _onFavoriteChanged,
        ),
        MeniulZileiScreen(
          onOptionChanged: _onDropdownChanged,
          selectedOption: _selectedOption,
          restaurants: _restaurants,
        ),
      ];
    });
  }

  void _onFavoriteChanged(Map<String, dynamic> restaurant) {
    setState(() {
      if (restaurant.containsKey('remove') && restaurant['remove']) {
        _favoriteRestaurants.removeWhere((fav) => fav['title'] == restaurant['title']);
      } else {
        _favoriteRestaurants.add(restaurant);
      }
      _homePageOptions = <Widget>[
        FoodAndMoreScreen(
          onOptionChanged: _onDropdownChanged,
          selectedOption: _selectedOption,
          favoriteRestaurants: _favoriteRestaurants,
          onFavoriteChanged: _onFavoriteChanged,
        ),
        FavoriteRestaurantsScreen(
          onOptionChanged: _onDropdownChanged,
          selectedOption: _selectedOption,
          favoriteRestaurants: _favoriteRestaurants,
          onFavoriteChanged: _onFavoriteChanged,
        ),
        MeniulZileiScreen(
          onOptionChanged: _onDropdownChanged,
          selectedOption: _selectedOption,
          restaurants: _restaurants,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('lib/images/tazz_logo.png', height: 30),
      ),
      body: Column(
        children: [
          const Divider(height: 0.7, color: Color.fromARGB(255, 228, 228, 228)),
          Expanded(
            child: Center(
              child: _selectedIndex == 0
                  ? _homePageOptions[
                      ['Food & More', 'Restaurante Favorite', 'Meniul Zilei']
                          .indexOf(_selectedOption)]
                  : _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Comenzi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Cont',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key, required this.onDropdownChanged});

  final ValueChanged<String?> onDropdownChanged;

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  String _selectedOption = 'Food & More';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DropdownButton<String>(
          value: _selectedOption,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.amber[800]),
          underline: Container(height: 2, color: Colors.amber[800]),
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
            widget.onDropdownChanged(newValue);
          },
          items: <String>['Food & More', 'Restaurante Favorite', 'Meniul Zilei']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.amber[800]),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
