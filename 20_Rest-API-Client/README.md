# Summary

---

##### Rest API (Representational State Transfer Application Programming Interface)

_Rest API_ adalah arsitektural yang memisahkan tampilan dengan proses bisnis. Rest API memungkinkan pengguna untuk berkomunikasi dengan server melalui protokol HTTP. Rest API menggunakan metode HTTP request seperti GET, POST, PUT, DELETE untuk berkomunikasi dengan server. Rest API mengirimkan data dalam format JSON atau XML.

##### HTTP

_HTTP_ (Hypertext Transfer Protocol) adalah protokol yang digunakan untuk mentransfer data melalui internet. HTTP menggunakan metode request dan response untuk berkomunikasi dengan server. Metode request yang sering digunakan adalah GET, POST, PUT, DELETE.
Struktur HTTP Response:

- Status Code
  Kode yang mewakili keseluruhan response.
- Header
  Informasi tambahan yang dikirim bersama response.
- Body
  Data yang dikirim bersama response.

Struktur HTTP Request:

- URL
  Alamat dari server yang akan diakses.
- Method (GET, POST, PUT, DELETE)
  Metode request yang digunakan.
- Header
  Informasi tambahan yang dikirim bersama request.
- Body
  Data yang dikirim bersama request.

#### DIO

_DIO_ (Dart IO) adalah library yang digunakan untuk berkomunikasi dengan server melalui protokol HTTP. DIO menyediakan metode request seperti GET, POST, PUT, DELETE. DIO juga menyediakan fitur untuk mengirim data dalam format JSON atau XML.

Implemntasi Dio:

1. Install package dio pada file pubspec.yaml

```yaml
dependencies:
  dio: ^4.0.0
```

2. Import package dio pada file dart

```dart
import 'package:dio/dio.dart';

void main() async {
  Dio dio = Dio();
  Response response = await dio.get('https://api.github.com/users/defrindr');
  print(response.data);
}
```

##### Serialization & Deserialization JSON

_Serialization_ adalah proses mengubah objek menjadi JSON. _Deserialization_ adalah proses mengubah JSON menjadi objek. Dart menyediakan library `dart:convert` untuk melakukan Serialization dan Deserialization JSON.
contoh Serialization:

```dart
import 'dart:convert';

void main() {
  Map<String, dynamic> user = {
    'name': 'defri',
    'age': 20,
  };
  String jsonUser = jsonEncode(user);
  print(jsonUser);
}
```

contoh Deserialization:

```dart
import 'dart:convert';

void main()
{
  String jsonUser = '{"name": "defri", "age": 20}';
  Map<String, dynamic> user = jsonDecode(jsonUser);
  print(user['name']);
}
```
