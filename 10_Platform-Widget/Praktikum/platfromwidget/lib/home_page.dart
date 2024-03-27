import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // Constructor
  const HomePage({super.key, required this.title, required this.value});
  final String title;
  final Map<String, String> value;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Data 
  final Map<String, String> values = {
    'John Doe': '1234567890',
    'Jane Smith': '0987654321',
    'Alice Johnson': '5678901234',
    'Bob Brown': '4321098765',
    'Charlie White': '6789012345',
    'David Black': '3456789012',
    'Eve Green': '7890123456',
    'Frank Blue': '2109876543',
    'Grace Red': '4567890123',
    'Henry Yellow': '9012345678',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      // Memebuat Drawer
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Membuat ListView untuk menampilkan data
            ListView.builder(
              shrinkWrap: true, // Menyesuaikan ukuran ListView
              itemCount: values.length, // Jumlah data
              // membuat item listView
              itemBuilder: (BuildContext context, int index) {
                final entry = values.entries.elementAt(index);
                final String name = entry.key;
                final String phone = entry.value;
                final String iconName = name[0];
                
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        iconName,
                        style: const TextStyle(fontSize: 20, color: Colors.white),
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
                          phone,
                          style: const TextStyle(fontSize: 15),
                        ),
                        // Membuat jarak antar item
                      const SizedBox(height: 10),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        selectedItemColor: const Color.fromARGB(255, 17, 193, 55),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/settings');
          }
        },
      ),
    );
  }
}
