import 'package:flutter/material.dart';

class ContScreen extends StatelessWidget {
  const ContScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilul meu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/images/proasta1.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ghitescu Caterinca',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Telefon: 07 n-am cartela',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Acasă'),
              subtitle: Text('Șoseaua Bucium 36, Iași 700282, Romania'),
            ),
            const ListTile(
              leading: Icon(Icons.work),
              title: Text('Work'),
              subtitle: Text('Str. Palas nr. 7D, Iasi 700051, Romania'),
            ),
            const SizedBox(height: 16),
            const ListTile(
              leading: Icon(Icons.payment),
              title: Text('Metode de plată'),
              subtitle: Text('Visa, Cash, Ochi Dulci'),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[900], 
                    foregroundColor: const Color.fromARGB(255, 255, 206, 168),
                  ),
                  child: const Text('Log Out'),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 206, 168), 
                    foregroundColor: Colors.amber[900],                  ),
                  child: const Text('Setări'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
