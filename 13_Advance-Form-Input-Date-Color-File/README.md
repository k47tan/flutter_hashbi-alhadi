# Summary

---

- **Date Picker**
  Widget dimana user dapat memilih tanggal dari kalender yang muncul ketika user mengklik input field.
  Untuk membuat date picker:

1.  Menggunakan fungsi bawaan flutter `showDatePicker()`. yang memiliki parameter sebagai berikut:

    - `context`: BuildContext
    - `initialDate`: CurrentDate (DateTime)
    - `firstDate`: DateTime (opsional, default: 1 Januari 1900)
    - `lastDate`: DateTime (opsional, default: 31 Desember 2100)

    Contoh Code:

```dart
Final selectDate = await showDatePicker(
  context: context,
  initialDate: currentDate,
  firstDate: DateTime(1900),
  lastDate: DateTime(curentDate.year + 5),
);
```

2. Menambahkan package intl di `pubspec.yaml` untuk mengubah format tanggal.Atau menggunakan Command `flutter pub add intl`.

```yaml
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.17.0
```

3. Mempersiapkan vatuable untuk menyimpan tanggal yang dipilih.

```dart
class _MyHomePageState extends State<MyHomePage> {
  DateTime _dueDate = DateTime.now();
  Final currentDate = DateTime.now();
}
```

4. Menambahkan input field untuk menampilkan tanggal yang dipilih.

```dart
Widget _buildDatePicker(BuildContext context) {
  return GestureDetector(
    onTap: () async {
      final selectedDate = await showDatePicker(
        context: context,
        initialDate: _dueDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(_dueDate.year + 5),
      );
      // fungsi setState untuk merubah state widget
      if (selectedDate != null && selectedDate != _dueDate) {
        setState(() {
          _dueDate = selectedDate;
        });
      }
    },
    child: AbsorbPointer(
      child: TextFormField(
        controller: TextEditingController(
          text: DateFormat('dd/MM/yyyy').format(_dueDate),
        ),
        decoration: InputDecoration(
          labelText: 'Due Date',
          prefixIcon: Icon(Icons.calendar_today),
        ),
      ),
    ),
  );
}
```

- **Color Picker**
  Widget dimana user dapat memilih warna dari palet warna yang muncul ketika user mengklik input field.
  Untuk membuat color picker:

1. Menggunakan package `flutter_colorpicker` di `pubspec.yaml` atau menggunakan Command `flutter pub add flutter_colorpicker`.

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_colorpicker: ^0.4.0
```

2. Mempersiapkan variable untuk menyimpan warna yang dipilih.

```dart
class _MyHomePage extends State<MyHomePage> {
  Color _currentColor = Colors.black;
}
```

3. Menambah input field untuk menampilkan warna yang dipilih.

```dart
Widget BuildColorPicker(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: BlockPicker( // bisa menggunakan widget seperti ColorPicker, SlidePicker
                pickerColor: _currentColor,
                onColorChanged: (color) {
                  setState(() {
                    _currentColor = color;
                  });
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    },
    child: AbsorbPointer(
      child: TextFormField(
        controller: TextEditingController(
          text: '#${_currentColor.value.toRadixString(16).substring(2)}',
        ),
        decoration: InputDecoration(
          labelText: 'Color',
          prefixIcon: Icon(Icons.color_lens),
        ),
      ),
    ),
  );
}
```

- **File Picker**
  Widget yang dimana user dapat mengakses storage, memilih dan membuka file.
  Untuk membuat File Picker:

1. Menggunakan packages `file_picker` di `pubspec.yaml` atau menggunakan Command `flutter pub add file_picker`. dan 'open_file' di `pubspec.yaml` atau menggunakan Command `flutter pub add open_file`.

```yaml
dependencies:
  flutter:
    sdk: flutter
  file_picker: ^4.0.0
  open_file: ^3.0.0
```

2. Import package.

```dart
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
```

3. membuat fungsi untuk membuka dan memilih file.

```dart
Future<void> _openFileExplorer() async {
  final result = await FilePicker.platform.pickFiles();
  if (result == null) return;
  final path = result.files.single.path;
  OpenFile.open(path);
}
```

4. Memanggil fungsi `_openFileExplorer()` pada widget yang diinginkan.

```dart
child: ElevatedButton(
  onPressed: _openFileExplorer,
  child: Text('Open File Picker'),
),
```
