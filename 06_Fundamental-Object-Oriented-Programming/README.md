# Summary
---

#### Introduction Object Orirented Programming
Object Orirented Programming (OOP) adalah adalah sebuah program  yang di susun dalam bentuk abstraksi (ciri khas baik data dan proses) object. OOP memiliki keuntungan yang dapat digunakan berulang dan memudahkan troubleshot karena akan berorientasi pada object.

OOP memiliki beberapa bagian, diantaranya:
- **Class**
Class merupakan sebuah abstraksi dari object, class memiliki ciri-ciri yang disebut _properti_ dan memiliki sifat, kemampuan yang disebut _method_. Untuk membuat Claas menggunakan kata kunci _class_ NamaClass {}.
```Dart
class Hewan{
    // Property --> ciri khas dari object

    // Method --> kemampuan atau sifat dari object
}

void main() {
    Hewan hewan1 = Hewan();
    Hewan hewan2 = Hewan();
    Hewan hewan3 = Hewan();
}
```
- **Property**
Property merupakan ciri-ciri dan hal-hal dari suatu class yang memiliki sifat seperti variabel.
```Dart
class Hewan{
    // Property --> ciri khas dari object
    int eye = 0;
    int foot = 0;
    // Method --> kemampuan atau sifat dari object
}

void main() {
    Hewan hewan1 = Hewan();
    Hewan hewan2 = Hewan();
    Hewan hewan3 = Hewan();

    // untuk mengakses property melalui namaObject.property
    print(hewan1.mata);
    print(hewan2.foot);
}
```
- **Method**
Method merupakan suatu sifat dari suatu class dan memiliki sifat seperti function.
```Dart
class Hewan{
    // Property --> ciri khas dari object
    int eye = 0;
    int foot = 0;
    // Method --> kemampuan atau sifat dari object
    String bersuara() {
        return "mbeeekkk";
    }
}

void main() {
    Hewan kucing = Hewan();
    kucing.eye = 2;
    kucing.foot = 4;

    print("kucing memeliki ${kucing.eye} mata dan memiliki ${kucing.foot} kaki, kemudian beruara ${kucing.bersuara()}");
    Hewan hewan2 = Hewan();
    Hewan hewan3 = Hewan();

    // untuk mengakses property melalui namaObject.property
    print(hewan1.mata);
    print(hewan2.foot);
}
```

