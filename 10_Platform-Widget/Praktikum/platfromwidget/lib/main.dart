import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'home_page.dart';


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      color: Colors.black,
      routes: {
        '/': (context) => const HomePage(title: 'Home Page', value: {}),
        '/settings': (context) => const SettingPage(),
      },
    )
  );
}
