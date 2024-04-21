import 'package:flutter/material.dart';
import 'package:myapps/controller/controller_contact.dart';
import 'package:myapps/controller/controller_text.dart';
import 'package:myapps/models/model_contact.dart';
import 'package:myapps/widgets/color_picker.dart';
import 'package:myapps/widgets/date_pcker.dart';
import 'package:myapps/widgets/file_picker.dart';
import 'package:provider/provider.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactController = Provider.of<ContactController>(context);
    final nameEditingController = Provider.of<NameEditingController>(context);
    final numberEditingController =
        Provider.of<NumberEditingController>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              return nameEditingController.validate(value!);
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _numberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Enter your phone number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              return numberEditingController.validate(value!);
            },
          ),
          SizedBox(height: 20),
          DatePicker(),
          SizedBox(height: 20),
          ColorPicker(),
          SizedBox(height: 20),
          FilePickerWidget(),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Membuat objek Contact dengan semua argumen yang diperlukan
                Contact newContact = Contact(
                  name: _nameController.text,
                  number: _numberController.text,
                  date: DateTime.now(), // Contoh: Tanggal saat ini
                  color: Colors.blue, // Contoh: Warna default
                  file: '', // Contoh: Tidak ada file terpilih
                );
                // Menambahkan kontak baru
                contactController.addContact(newContact, context);
                // Membersihkan bidang teks setelah menambahkan kontak
                _nameController.clear();
                _numberController.clear();
                // Kembali ke layar sebelumnya
                Navigator.pop(context);
                // Menampilkan snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Contact added successfully!'),
                  ),
                );
              }
            },
            child: Text('Add Contact'),
          ),
        ],
      ),
    );
  }
}
