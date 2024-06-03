import 'package:flutter/material.dart';

class RestauranteFavoriteScreen extends StatelessWidget {
  const RestauranteFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurante Favorite'),
      ),
      body: const Center(
        child: Text(
          'Aici vei putea vedea lista cu restaurantele tale favorite.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}