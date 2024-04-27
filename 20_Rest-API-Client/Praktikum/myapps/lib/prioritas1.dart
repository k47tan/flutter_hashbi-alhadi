import 'package:dio/dio.dart';

void main() async {
  nomor_3();
}

Future<void> nomor_1() async {
  Dio dio = Dio();

  try {
    Map<String, dynamic> postData = {
      "name": "John Doe",
      "email": "johndoe@example.com",
      "phone": "1234567890"
    };

    Response response = await dio.post(
      "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/",
      data: postData,
    );

    // Menampilkan response dari server
    print("Response Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");
  } catch (e) {
    print("Error: $e");
  }
}

class Contact {
  int id;
  String name;
  String phone;

  Contact({required this.id, required this.name, required this.phone});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }
}

Future<void> nomor_2() async {
  // Data JSON yang diterima dari API
  Dio dio = Dio();

  try {
    Response response = await dio.get(
      "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2",
    );

    if (response.statusCode == 200) {
      // Response sukses, convert JSON ke object Contact
      Contact contact = Contact.fromJson(response.data);

      // Tampilkan data dari object Contact
      print("Contact ID: ${contact.id}");
      print("Contact Name: ${contact.name}");
      print("Contact Phone: ${contact.phone}");
    } else {
      print("Failed to load contact data: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
  }
}

Future<void> nomor_3() async {
  Dio dio = Dio();

  try {
    // Data yang akan dikirim dalam format JSON
    Map<String, dynamic> putData = {
      "id": 1,
      "title": "foo",
      "body": "bar",
      "userId": 1,
    };

    Response response = await dio.put(
      "https://jsonplaceholder.typicode.com/posts/1",
      data: putData,
    );

    // Menampilkan response dari server
    print("Response Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");
  } catch (e) {
    print("Error: $e");
  }
}