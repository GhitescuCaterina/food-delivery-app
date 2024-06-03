import 'package:flutter/material.dart';
import 'comenzi.dart';
import 'cart_screen.dart';
import 'cont_screen.dart';
import 'food_more.dart';
import 'restaurante_favorite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _selectedOption = 'Food & More';

  late List<Widget> _homePageOptions;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _homePageOptions = <Widget>[
      FoodAndMoreScreen(
        onOptionChanged: _onDropdownChanged,
        selectedOption: _selectedOption,
      ),
      FavoriteRestaurantsScreen(
        onOptionChanged: _onDropdownChanged,
        selectedOption: _selectedOption,
      ),
      const Center(
          child: Text('Meniul Zilei')), // Placeholder for another screen
    ];

    _widgetOptions = <Widget>[
      HomePageContent(
        onDropdownChanged: _onDropdownChanged,
      ),
      CartScreen(),
      const Comenzi(),
      const ContScreen(), // Adaugă ContScreen
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
        ),
        FavoriteRestaurantsScreen(
          onOptionChanged: _onDropdownChanged,
          selectedOption: _selectedOption,
        ),
        const Center(
            child: Text('Meniul Zilei')), // Placeholder for another screen
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String dropdownLabel = '';
    switch (_selectedOption) {
      case 'Food & More':
        dropdownLabel = 'Food & More';
        break;
      case 'Restaurante Favorite':
        dropdownLabel = 'Restaurantele tale favorite';
        break;
      case 'Meniul Zilei':
        dropdownLabel = 'Meniul Zilei';
        break;
    }

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
                  ? _homePageOptions[[
                      'Food & More',
                      'Restaurante Favorite',
                      'Meniul Zilei'
                    ].indexOf(_selectedOption)]
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
                style: TextStyle(
                    color: Colors
                        .amber[800]), // Set the color for dropdown items here
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
