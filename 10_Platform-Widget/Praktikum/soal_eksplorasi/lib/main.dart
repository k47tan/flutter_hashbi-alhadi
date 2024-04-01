import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primaryColor: const Color(0xFF00A8E8),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFA8E800),
        ),
      ),
      home: const MyHomePage(title: 'Alta - Widget Layout - Exploration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> values = [
    'lean Dart',
    'lean Java',
    'lean Python',
    'lean JavaScript',
    'lean C++',
    'lean Ruby',
    'lean Go',
    'lean Swift',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColor,
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
                final String value = values[index];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.laptop_chromebook_sharp,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          value,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.arrow_forward_sharp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
        ],
        selectedItemColor: Theme.of(context).primaryColor,
        // unselectedItemColor: ,
      ),
    );
  }
}
