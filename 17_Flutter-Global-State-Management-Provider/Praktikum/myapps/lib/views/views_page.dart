import 'package:flutter/material.dart';
import 'package:myapps/widgets/contact_list.dart';

class ViewContacts extends StatefulWidget {
  const ViewContacts({super.key});

  @override
  State<ViewContacts> createState() => _ViewContactsState();
}

class _ViewContactsState extends State<ViewContacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(15.0),
          children: [
            ListTile(
              leading: Icon(Icons.image_outlined),
              title: const Text('Galery'),
              onTap: () {
                Navigator.pushNamed(context, '/gallery');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: const ContactList(),
      // buatkan eleavated button untuk addcontact
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, '/formContact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
