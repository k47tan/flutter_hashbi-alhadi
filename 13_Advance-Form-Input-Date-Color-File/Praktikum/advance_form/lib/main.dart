import 'package:flutter/material.dart';
import 'package:advance_form/add_contact.dart';
import 'package:advance_form/contact.dart';

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
      },
    ),
  );
}
