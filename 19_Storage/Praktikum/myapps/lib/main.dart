import 'package:flutter/material.dart';
import 'package:myapps/views/view_login.dart';
import 'views/view_addcontact.dart';
import 'views/view_contact.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ViewLogin(),
        '/listContact': (context) => const ContactList(
              username: '',
            ),
        '/addContact': (context) => const AddContact(title: 'Add Contact'),
      },
    ),
  );
}
