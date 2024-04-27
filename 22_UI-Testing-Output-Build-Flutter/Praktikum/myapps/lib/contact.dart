import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  _ContactListState createState() => _ContactListState();
}

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

class _ContactListState extends State<ContactList> {
  List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true, // Menyesuaikan ukuran ListView
          itemCount: contacts.length, // Jumlah data
          // membuat item listView
          itemBuilder: (BuildContext context, int index) {
            final Contact contact = contacts[index];
            final String name = contact.name;
            final String phoneNumber = contact.phoneNumber;
            final String iconName = name[0];

            return Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 189, 146, 241),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          iconName,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            phoneNumber,
                            style: const TextStyle(fontSize: 15),
                          ),
                          // Membuat jarak antar item
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        // Navigasi ke halaman AddContact dengan data kontak yang akan diubah
                        final editedContact = await Navigator.pushNamed(
                            context, '/addContact',
                            arguments: contact);
                        if (editedContact != null && editedContact is Contact) {
                          setState(() {
                            // Perbarui data kontak yang ada dengan data yang telah diedit
                            contacts[index] = editedContact;
                          });
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Hapus kontak dari daftar kontak
                        setState(() {
                          contacts.removeAt(index);
                        });
                      },
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Add"),
        backgroundColor: const Color.fromARGB(255, 197, 165, 233),
        onPressed: () async {
          // Menavigasi ke halaman AddContact dan menunggu hasilnya
          final result = await Navigator.pushNamed(context, '/addContact');
          if (result != null && result is Contact) {
            // Periksa apakah hasilnya adalah objek Contact
            // Jika hasilnya bukan null dan merupakan objek Contact, tambahkan kontak ke daftar kontak
            setState(() {
              contacts.add(result);
            });
          }
        },
      ),
    );
  }
}
