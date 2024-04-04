import 'package:flutter/material.dart';
import 'package:flutter_from/contact.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key, required this.title});
  final String title;

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                    color: Colors.deepPurple,
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
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "input your name",
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        prefixIconColor: Colors.deepPurple,
                      ),
                      validator: (value) {
                        String patternNumber = r'[0-9!@#\$%^&*(),.?":{}|<>]';
                        RegExp regexNumbers = RegExp(patternNumber);
                        String patternLetter =
                            r"^[A-Z][a-z]*(?:\s[A-Z][a-z]*)*$";
                        RegExp regexLetters = RegExp(patternLetter);
                        if (value == null || value.isEmpty) {
                          return "Data is empty";
                        }
                        if (regexNumbers.hasMatch(value)) {
                          return "Data is contain number and symbol";
                        }
                        if (value.trim() != value) {
                          return "Blank Letter detected";
                        }
                        if (!regexLetters.hasMatch(value)) {
                          return "Each word must start with a capital later";
                        }
                        // if (value.length <= 2) {
                        //   return "Data is less than 2 letters";
                        // }
                        debugPrint("Data Nama : ${widget.title}");
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: phoneNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "input your phone number",
                        prefixIcon: Icon(
                          Icons.phone,
                        ),
                        prefixIconColor: Colors.deepPurple,
                      ),
                      validator: (value) {
                        String pattern = r'^[0-9]*$';
                        RegExp regex = RegExp(pattern);
                        if (value == null || value.isEmpty) {
                          return "Data is empty";
                        }
                        if (value.length < 8) {
                          return "Data is less than 8 digits";
                        }
                        if (value.length > 15) {
                          return "Data is more than 15 digits";
                        }
                        if (!regex.hasMatch(value)) {
                          return "Data is not a number";
                        }
                        if (value.substring(0, 1) != '0') {
                          return "Data is not start with 0";
                        }
                        debugPrint("Data Nomor Telepon : ${widget.title}");
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String name = nameController.text.trim();
                              String phoneNumber =
                                  phoneNumberController.text.trim();
                              contacts.add(Contact(
                                  name: name, phoneNumber: phoneNumber));
                              debugPrint(
                                  "Added contact at index ${contacts.length - 1}");
                              Navigator.pop(context, contacts.last);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 197, 165, 233),
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 24,
                            ),
                          ),
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
