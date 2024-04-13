import 'package:flutter/material.dart';
import 'package:assets/add_contact.dart';
import 'package:assets/contact.dart';
import 'package:assets/galery.dart'; // Remove the unused import statement

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ContactList(),
        '/addContact': (context) => const AddContact(title: 'Add Contact'),
        '/gallery': (context) =>
            Gallery(), // Change the class name to 'Gallery'
      },
    ),
  );
}
