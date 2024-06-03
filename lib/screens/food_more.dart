import 'package:flutter/material.dart';

class FoodAndMoreScreen extends StatefulWidget {
  final ValueChanged<String?> onOptionChanged;
  final String selectedOption;

  const FoodAndMoreScreen(
      {Key? key, required this.onOptionChanged, required this.selectedOption})
      : super(key: key);

  @override
  _FoodAndMoreScreenState createState() => _FoodAndMoreScreenState();
}

class _FoodAndMoreScreenState extends State<FoodAndMoreScreen> {
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
      body: ListView(
        children: [
          _buildItem(
              'Oscar',
              'Restaurant Oscar – locul în care lași în urmă agitația zilnică și te bucuri de momente îndelungate de răsfăț.',
              'restaurant1.png'),
          _buildItem(
              'McDonalds',
              'McDonalds is an American multinational fast food chain, founded in 1940 as a restaurant',
              'restaurant2.png'),
          _buildItem(
              'Sushi House',
              'Bucura-te de gustul autentic al bucatariei japoneze preparat cu ingrediente de calitate.',
              'restaurant3.png'),
          _buildItem(
              'Sushi Master',
              'Complexitate și rafinament în restaurantul nostru din centrul orașului!',
              'restaurant4.png'),
          _buildItem(
              'eten & drinken',
              'O cafenea din Iasi cu bubble tea, brunch si produse de patiserie.',
              'cafenea1.png'),
          _buildItem(
              'Restaurant la Mama',
              'La Mama este o interpretare moderna a bucatariei romanesti.',
              'order3.png'),
          _buildItem(
              'Kaufland',
              'Valorile companiei noastre sunt principii de ghidare care își pun amprenta asupra comportamentului nostru.',
              'magazin1.png'),
          _buildItem(
              'Mega Image',
              'Ghidați zilnic de valorile pe care le împărtășim: integritate, curaj, muncă în echipă, grijă și umor.',
              'magazin2.png'),
          _buildItem(
              'Altceva',
              'Comandă mâncare street food pentru toate gusturile, de la burgeri, crispy, până la aripioare și shaorma.',
              'altceva.png'),
          _buildItem(
              'Pizza Hut',
              'Știm câtă nerăbdare se ascunde în așteptarea pizzei preferate.',
              'pizzahut.png')
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
