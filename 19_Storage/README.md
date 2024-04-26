# Summary

---

**Storage** adalah teknik untuk menyimpan data secara permanen di aplikasi. Dengan teknik ini, data yang disimpan akan tetap ada meskipun aplikasi ditutup dan dibuka kembali. Flutter menyediakan beberapa cara untuk menyimpan data, di antaranya adalah menggunakan _shared preferences_, dan _database(SQLite)_.

**Shared Preferences**
Shared Preferences adalah cara termudah untuk menyimpan data sederhana di Flutter. Shared Preferences menyimpan data dalam bentuk key-value pair. Data yang disimpan menggunakan Shared Preferences akan tetap ada meskipun aplikasi ditutup dan dibuka kembali. Shared Preferences sangat cocok digunakan untuk menyimpan data yang sifatnya sederhana, seperti _user preferences_, _user settings_, dan lain-lain.
implemntasi shared_preferences

install shared_preferences

```bash
$ flutter pub add shared_preferences
```

untuk menambahkan kedalam dependecies pada file `pubspec.yaml`

```bash
$ flutter pub get
```

menggunakan shared_preferences

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesExample extends StatefulWidget {
  @override
  _SharedPreferencesExampleState createState() => _SharedPreferencesExampleState();
}

class _SharedPreferencesExampleState extends State<SharedPreferencesExample> {
  final TextEditingController _controller = TextEditingController();
  String _text = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _text = prefs.getString('text') ?? '';
    });
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('text', _controller.text);
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter some text',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveData,
              child: Text('Save'),
            ),
            SizedBox(height: 16),
            Text('Text: $_text'),
          ],
        ),
      ),
    );
  }
}
```

**Database (SQLite)**
Database (SQLite) adalah cara yang lebih kompleks untuk menyimpan data di Flutter. Database SQLite adalah database relasional yang menggunakan bahasa SQL untuk mengakses dan mengelola data. Database SQLite sangat cocok digunakan untuk menyimpan data yang sifatnya kompleks, seperti data pengguna, data aplikasi, dan lain-lain.
implementasi database sqlite

install sqflite

```bash
$ flutter pub add sqflite
```

untuk menambahkan kedalam dependecies pada file `pubspec.yaml`

```bash
$ flutter pub get
```

membuat database helper

```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB();
    return _database;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'example.db');
    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE example(id INTEGER PRIMARY KEY, name TEXT)',
      );
    }, version: 1);
  }
}
```

membuat model

```dart
class Example {
  final int id;
  final String name;

  Example({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
```

membuat repository

```dart
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_example/model/example.dart';
import 'package:sqlite_example/utils/database_helper.dart';

class ExampleRepository {
  final dbHelper = DatabaseHelper.database;

  Future<void> insertExample(Example example) async {
    final db = await dbHelper;
    await db!.insert(
      'example',
      example.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Example>> getExamples() async {
    final db = await dbHelper;
    final List<Map<String, dynamic>> maps = await db!.query('example');
    return List.generate(maps.length, (i) {
      return Example(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }
}
```

menggunakan repository

```dart
import 'package:flutter/material.dart';
import 'package:sqlite_example/model/example.dart';
import 'package:sqlite_example/repository/example_repository.dart';

class SQLiteExample extends StatefulWidget {
  @override
  _SQLiteExampleState createState() => _SQLiteExampleState();
}

class _SQLiteExampleState extends State<SQLiteExample> {
  final TextEditingController _controller = TextEditingController();
  final exampleRepository = ExampleRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter some text',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await exampleRepository.insertExample(
                  Example(
                    id: 1,
                    name: _controller.text,
                  ),
                );
                setState(() {
                  _controller.clear();
                });
              },
              child: Text('Save'),
            ),
            SizedBox(height: 16),
            FutureBuilder<List<Example>>(
              future: exampleRepository.getExamples(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!.map((example) {
                      return ListTile(
                        title: Text(example.name),
                      );
                    }).toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

**Perbedaan Shared Preferences dan Database (SQLite)**

- Shared Preferences cocok digunakan untuk menyimpan data sederhana, seperti _user preferences_, _user settings_, dan lain-lain. Sedangkan Database (SQLite) cocok digunakan untuk menyimpan data yang sifatnya kompleks, seperti data pengguna, data aplikasi, dan lain-lain.
- Shared Preferences menyimpan data dalam bentuk key-value pair, sedangkan Database (SQLite) menyimpan data dalam bentuk tabel.
- Shared Preferences menyimpan data dalam bentuk _plain text_, sedangkan Database (SQLite) menyimpan data dalam bentuk _binary_.
- Shared Preferences tidak memerlukan _query_ untuk menyimpan dan mengambil data, sedangkan Database (SQLite) memerlukan _query_ untuk menyimpan dan mengambil data.
