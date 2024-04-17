import 'package:flutter/material.dart';
import 'package:project/welcome_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeView(),
      },
    ),
  );
}
