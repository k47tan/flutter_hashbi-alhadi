import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Hallo Alterra",
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          backgroundColor: Colors.orange,
          centerTitle: true, 
          actions: [
            IconButton( 
              icon: const Icon(Icons.account_circle_rounded),
              onPressed: () {}, //
            ),
          ],
        ),
        body: const Center(
          child: Text("Nama Saya Adalah Hashbi Alhadi",
          textAlign: TextAlign.center
          )
        ),
      ),
    );
  }
}
