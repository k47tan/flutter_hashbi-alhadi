import 'package:flutter/material.dart';
import 'package:myapps/controller/controller_contact.dart';
import 'package:myapps/controller/controller_text.dart';
import 'package:myapps/widgets/contact_form.dart';
import 'package:provider/provider.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final contact = Provider.of<ContactController>;
  final editedContact = Provider.of<ContactController>;
  final nameController = Provider.of<NameEditingController>;
  final numberController = Provider.of<NumberEditingController>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Contact',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                left: 40.0,
                right: 40.0,
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.contact_page_outlined,
                    size: 30,
                    color: Colors.blueAccent,
                  ),
                  Text(
                    "Create New Contacts",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for decision to be made.",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(255, 74, 73, 73),
                    ),
                  ),
                  ContactForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
