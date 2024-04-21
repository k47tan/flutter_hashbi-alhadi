import 'package:flutter/material.dart';
import 'package:myapps/models/model_contact.dart';

class ContactController extends ChangeNotifier {
  List<Contact> _contactsList = [];
  Contact? _editedContact;

  List<Contact> get contactsList => _contactsList;
  Contact? get editedContact => _editedContact;

  void addContact(Contact contact, void print) {
    _contactsList.add(contact);
    notifyListeners();
  }

  void updateContact(int index, Contact updatedContact) {
    _contactsList[index] = updatedContact;
    notifyListeners();
  }

  void deleteContact(int index) {
    _contactsList.removeAt(index);
    notifyListeners();
  }

  void editContact(Contact? contact) {
    _editedContact = contact;
    notifyListeners();
  }
}
