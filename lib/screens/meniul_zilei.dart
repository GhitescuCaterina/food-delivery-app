import 'package:flutter/material.dart';


class MeniulZileiScreen extends StatelessWidget {
  const MeniulZileiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meniul Zilei'),
      ),
      body: const Center(
        child: Text(
          'Aici vei putea vedea meniul zilei și ofertele speciale.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}