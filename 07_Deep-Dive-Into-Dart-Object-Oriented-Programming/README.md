# Summary

#### Constructor
Constructor adalah method yang dilajakan saat pembuatan object dan dapat menerima parameter, tidak memiliki return dan nama sama dengan nama class.
Contoh:
```Dart
Class Hewan() {
    var mata;
    var kaki;

    var( {
        mata = 0;
        kaki = 0;
    })
}
```
#### inheritance 
Membuat class baru dengan memanfaatkan class yang sudah ada, yang bertujuan agar kemampuan class yang sudah ada dapat dimiliki class baru  

contoh:
```Dart
Class Kambing extends Hewan {
    var warnaBulu;
    var jenisMakanan;

    Kambing({
        mata = 2;
        kaki = 4;
        warnaBulu = 'putih';
        jenisMakanan = 'rumput';
    })
}
```
#### Method Overriding
menulis ulang method yang adal pada super-class yang bertujuan agar classs memiliki method yang sama namun dengan implementasi yang berbeda.
tata cara meelakukan _Overriding_:
1. Dilakukan pada class yang melakukan inhertance
2. Method yang akan di _Overriding_ harus memiliki nama yang sama dengan method yang ada pada super-class
3. Method yang akan di _Overriding_ harus memiliki parameter yang sama dengan method yang ada pada super-class
4. Method yang akan di _Overriding_ harus memiliki return type yang sama dengan method yang ada pada super-class
5. Menambhkan tanad @override di baris sebelum method yang dibuat.
contoh:
```Dart
Class Hewan {
    reproduksi() {
        print('Tidak diketahui ');
    }

    bernapas() {
        print('Tidak diketahui');
    }
}

class Kambing extends Hewan {
    @override
    reproduksi() {
        print('Vivipar');
    }

    @override
    bernapas() {
        print('Paru-paru');
    }
}
```


#### Abstract Class
Abstract class adalah class yang tidak dapat di instansiasi, hanya bisa di gunakan sebagai super-class. Abstract class dapat memiliki abstract method dan non-abstract method. 
contoh:
```Dart
abstract class Hewan {
    void reproduksi();
    void bernapas() {
        print('Paru-paru');
    }
}

class Kambing extends Hewan {
    @override
    reproduksi() {
        print('Vivipar');
    }
}
```

#### Enkapsulasi
Enkapsulasi adalah pembungkusan data dan method dalam sebuah class agar data tersebut tidak dapat di akses dari luar class. Enkapsulasi dapat dilakukan dengan menggunakan _private_ dan _getter_ dan _setter_.