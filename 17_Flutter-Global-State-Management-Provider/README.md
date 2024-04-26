# Summary

---

_State_ merupakan data yang berubah-ubah pada aplikasi. State bisa berupa data yang diambil dari server, data yang diinput oleh user, data yang diambil dari local storage, dan lain-lain.

_Global State Management_ merupakan teknik untuk mengelola state secara global. Dengan teknik ini, state bisa diakses dan diubah dari berbagai tempat di aplikasi.
Global State Management sangat berguna ketika kita ingin mengakses state dari berbagai tempat di aplikasi, misalnya dari berbagai _widget_ di aplikasi Flutter.

_Provider_ adalah salah satu library yang bisa digunakan untuk mengelola state secara global di Flutter. _Provider_ memungkinkan kita untuk membuat state yang bisa diakses dari berbagai tempat di aplikasi.

**installasi provider**

1. Pada terminal ketikkan perintah berikut:

```bash
$ flutter pub add provider
```

untuk menambahkan kedalam dependecies pada file `pubspec.yaml`

```bash
$ flutter pub get
```

untuk menginstall package provider

**Membuat State Provider**
untuk membuat state kia perlu definisikan dalam bentuk class

```dart
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  List<Map<String, String>> _contact = [];

    List<Map<String, String>> get contact => _contact;

    void addContact(String name, String phone) {
      _contact.add({
        'name': name,
        'phone': phone,
      });
      notifyListeners();
    }
}
```

**Menggunakan Provider**
import package provider pada file `main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/counter_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterProvider.Contact()),
    ],
    child: MyApp(),
    ),
  );
}
```

**Menggunakan State dari Provider**
Simpan data pada provider dan ambil data dari provider melalui getter

```dart
// build
final contactProvider = Provider.of<CounterProvider.Contact>(context);

// return
ListView.builder(
  itemCount: contactProvider.contact.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(contactProvider.contact[index]['name'] ?? ''),
      subtitle: Text(contactProvider.contact[index]['phone'] ?? ''),
    );
  },
);
```

hal yang perlu diperhatikan dalam menggunakan provider adalah :

1. **ChangeNotifier**
   change notifier adalah class yang digunakan untuk membuat state yang bisa diakses dari berbagai tempat di aplikasi. Class ini memiliki method `notifyListeners()` yang digunakan untuk memberitahukan bahwa state telah berubah.
2. **ChangeNotifierProvider**
   ChangeNotifierProvider adalah class yang digunakan untuk membuat state yang bisa diakses dari berbagai tempat di aplikasi. Class ini memiliki method `create` yang digunakan untuk membuat instance dari class ChangeNotifier.
3. **Provider.of**
   Provider.of adalah method yang digunakan untuk mengakses state dari provider. Method ini memiliki dua parameter yaitu context dan class provider yang ingin diakses. Method ini mengembalikan instance dari class provider yang diakses.
4. **MultiProvider**
   MultiProvider adalah class yang digunakan untuk menggabungkan beberapa provider menjadi satu. Class ini memiliki property `providers` yang digunakan untuk menambahkan provider yang ingin digabungkan.
5. **Consumer**
   Consumer adalah widget yang digunakan untuk mengakses state dari provider. Widget ini memiliki property `builder` yang digunakan untuk mengakses state dari provider.
