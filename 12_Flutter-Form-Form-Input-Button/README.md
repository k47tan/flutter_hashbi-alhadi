# Summary

---

#### From

From merupakan atribut yang digunakan untuk menerima inputan dari user. Inputan yang diterima bisa berupa _teks_, _angka_, _password_, dll. Inputan yang diterima akan disimpan dalam _variabel_ yang dideklarasikan pada atribut from.
Form menggunakan StatefulWidget, sehingga ketika nilai dari atribut from berubah, maka _widget_ akan di-_rebuild_. Keadaaan form disimpan menggunakan `GlobalKey<FormState>` yang dideklarasikan pada atribut key.

```dart
// property
var _formKey = GlobalKey<FormState>();
// build
Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
      RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            // Process data.
          }
        },
        child: Text('Submit'),
      ),
    ],
  ),
)
```

#### Input

- **TextFormField**
  TextFromField merupakan _widget_ yang digunakan untuk menerima inputan dari user berupa _teks_. TextFormField memiliki beberapa atribut yang bisa digunakan untuk mengatur inputan yang diterima, seperti validator, controller, decoration, dll.

```dart
// property
TextEditingController _controller = TextEditingController();
// build
TextFormField(
  controller: _controller,
  decoration: InputDecoration(
    labelText: 'Enter your username',
  ),
  validator: (value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  },
)
```

- **Radio**
  Radio merupakan _widget_ yang digunakan untuk menerima inputan dari user berupa _pilihan_. Radio memiliki beberapa atribut yang bisa digunakan untuk mengatur inputan yang diterima, seperti value, groupValue, onChanged, dll.

```dart
// property
int _groupValue = '';
// build
Column(
  children: [
    Radio(
      value: 'A',
      groupValue: _groupValue,
      onChanged: (value) {
        setState(() {
          _groupValue = value;
        });
      },
    ),
    Radio(
      value: 'B',
      groupValue: _groupValue,
      onChanged: (value) {
        setState(() {
          _groupValue = value;
        });
      },
    ),
  ],
)
```

- **Checkbox**
  Checkbox merupakan _widget_ yang digunakan untuk menerima inputan dari user berupa _opsi_ yang dapat dipilih beberapa sekaligus. Checkbox memiliki beberapa atribut yang bisa digunakan untuk mengatur inputan yang diterima, seperti value, onChanged, dll.

```dart
// property
bool _value = false;
// build
Checkbox(
  value: _value,
  onChanged: (boll? value) {
    setState(() {
      _value = value ?? false;
    });
  },
)
```

- **DropdownButton**
  DropdownButton merupakan _widget_ yang digunakan untuk menerima inputan dari user berupa _pilihan_. Pilihan hanya tampil jika ditekan. DropdownButton memiliki beberapa atribut yang bisa digunakan untuk mengatur inputan yang diterima, seperti value, items, onChanged, dll.

```dart
// property
String _value = '';
// build
DropdownButton<String>(
  value: _value,
  items: [
    DropdownMenuItem(
      value: 'A',
      child: Text('A'),
    ),
    DropdownMenuItem(
      value: 'B',
      child: Text('B'),
    ),
  ],
  onChanged: (String? value) {
    setState(() {
      _value = value ?? '';
    });
  },
)
```

#### Button

- **ElevatedButton**
  ElevatedButton merupakan _widget_ yang digunakan untuk membuat tombol dengan _style_ yang lebih menonjol. Jika ditekan akan menjalankan **onPressed** ElevatedButton memiliki beberapa atribut yang bisa digunakan untuk mengatur _style_ dari tombol, seperti onPressed, child, dll.

```dart
ElevatedButton(
  onPressed: () {
    // Do something
  },
  child: Text('Submit'),
)
```

- **IconButon**
  IconButton merupakan _widget_ yang digunakan untuk membuat tombol dengan _icon_ yang lebih menonjol. Jika ditekan akan menjalankan **onPressed** IconButton memiliki beberapa atribut yang bisa digunakan untuk mengatur _icon_ dari tombol, seperti onPressed, icon, dll.

```dart
IconButton(
  onPressed: () {
    // Do something
  },
  icon: Icon(Icons.add),
)
```
