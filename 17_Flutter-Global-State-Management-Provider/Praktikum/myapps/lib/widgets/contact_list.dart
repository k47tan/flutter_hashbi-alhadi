import 'package:flutter/material.dart';
import 'package:myapps/controller/controller_contact.dart';
import 'package:myapps/models/model_contact.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactController = Provider.of<ContactController>(context);

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: contactController.contactsList.length,
        itemBuilder: (context, index) {
          final Contact contact = contactController.contactsList[index];
          final String iconName = contact.name[0];
          final Color iconColor = contact.color;

          return Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text(
                  iconName,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      contact.number,
                      style: const TextStyle(fontSize: 15),
                    ),
                    // Membuat jarak antar item
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Provider.of<ContactController>(context, listen: false)
                          .editContact(contact);
                      Navigator.pushNamed(context, '/fromContact');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      contactController.deleteContact(index);
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
