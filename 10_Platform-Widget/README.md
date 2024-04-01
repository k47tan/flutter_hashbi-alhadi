# Summary
---

### MaterialApp
Widget dasar yang mengemas seluruh aplikasi Flutter. `MaterialApp` memiliki banyak properti yang memungkinkan kita untuk mengatur tema, bahasa, dan navigasi aplikas pada sistem _Android_ dan diimport dari `package:flutter/material.dart`. 

```Dart
MaterialApp(
      theme: ThemeData.dark(), // untuk mengatur tema aplikasi
      initialRoute: 'home', // untuk mengatur halaman pertama yang akan ditampilkan
      routes: {
        'home': (_) => const HomePage(), // menddaftarkan halaman pada routes
      },
    )
```

- __Scaffold__
Widget dasar untuk mengatur tata letak aplikasi Flutter. `Scaffold` memiliki banyak properti yang memungkinkan kita untuk menambahkan _app bar_, _drawer_, _bottom navigation_, dan _floating action button_.

```Dart
Scaffold(
      appBar: AppBar(...), // Bar Menu paling atas
      drawwer: Drawer(...);
      body: ,
      bottomNavigationBar: BottomNavigationBar(...), // Bar Menu paling bawah
      );
```
### CupertinoApp
Widget dasar yang mengemas seluruh aplikasi Flutter. CupertinoApp memiliki banyak properti yang memungkinkan kita untuk mengatur tema, bahasa, dan navigasi aplikas pada sistem _iOS_ dan diimport dari `package:flutter/cupertino.dart`. 

pada CupertinoApp kita tidak bisa menggunakan `Scaffold` melainkan `CupertinoPageScaffold` yang memiliki properti yang sama dengan `Scaffold`.

CupertinoApp tidak menyediakan `ThemeData.dark()` oleh karena itu kita perlu membuat sendiri dengan:

```Dart
final _themeDark = const CupertinoThemeData(
  brightness: Brightness.dark,
);
```
. __CupertinoPageScaffold__
Widget dasar untuk mengatur tata letak aplikasi Flutter. `CupertinoPageScaffold` memiliki banyak properti yang memungkinkan kita untuk menambahkan _navigation bar_, _tab bar_, dan _floating action button_.
```Dart
CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(...), // Bar Menu paling atas
      child: , // Bagian halaman
      );
```