# Summary
---

#### Anonymous Function
Anonymous Function adalah function yang tidak memiliki nama dan bisa dibuat sebagai data di parameter.
contoh:
```Dart
var hello = () {
    print('katan');
};
var jumlah = (int a, int b) {
    return a + b;
};

void main() {

    hello();
    print(jumlah(1,2));

}
```

#### Arrow Function
Kita dapat membuat _function_ dengan lebih ringkas, dapat memiliki nama atau tidak dan miliki satu data baik dari proses maupun data statis dan untuk nilai return ini diambil dari data tersebut.
contoh:
```Dart
var hello = () => print('katan');

var jumlah = (int a, int b) => return a + b;

void main() {

    hello();
    print(jumlah(1,2));

}
```

#### Named Parameter
Difenisikan dengan {} untuk memperjelas argumen saat dipanggil dan _required_ wajib untuk diiisi.
contoh:
```Dart
void greet({required String name, required int age}) {
    
    print("Hello $name. You are $age years old.");

}

void main() {

    greet(age: 24, name: 'katan'); // urutan parameter bisa ditukar

}
```

#### Optional Parameter
Posisional dalam [], untuk nilai default ditentukan dan secara implisit opsional.
contoh:
```Dart
void printNumbers(int a, [int? b, int? c]) {
    
    print('a: $a, b: $b, c: $c');

}

void main() {
    printNumbers(1); // output a: 1, b: null, c: null
    printNumbers(1, 2); // output a: 1, b: 2, c: null
    printNumbers(1, 2, 3); // output a: 1, b: 2, c: 3
}

```

#### Async-Await
Async-await digunakan untuk dapat menjalankan beberapa proses tanpa perlu menunggu proses lainnya selesai yang tulis dalam bentuk fungsi dan _await_ akan menunggu hingga proses _async_ selesai.
contoh:
```Dart
void p1() {
    Future.delayed(Duration(seconds: 1), () {
        print('Hashby');
    });
}

void p2() {
    print('Alhadi');
}

void main() {
    p1(); // p1 akan delay selama 1 detik sebelum tanpil
    p2(); // output akan menjalankan P2 terlebih dahulu tanpa harus menunggu p1 selesai
}
```
```Dart
Future<void> p1() async{
    await Future.delayed(Duration(seconds: 1), () {
        print('Hashby');
    });
}

void p2() {
    print('Alhadi');
}

void main() async{ // menjadi async karena ada await didalam
    await p1(); // p1 akan dijalankan setelah 1 detik
    p2(); // p2 akan dijalankan setelah p1 selesai
}
```
- **Tipe Data Future**
Menggunakan Future kita dapat membuat durasi ketika function akan dijalankan dan untuk data return kita perlu keyword _async_ .
```Dart
Future<String> p1() async{ // memiliki tipe data string untuk di return
    await Future.delayed(Duration(seconds: 1), () {
        return 'Hashby';
    });
}

void main() async{ // menjadi async karena ada await didalam
    var data = await p1(); // membuat variabel data yang dimana didalamnya ada p1 yang menghasilkan Future  memiliki tipe data String dan dijalankan setelah 1 detik
    print(data); // Output Hashby

}
```

#### Collection
Collection adalah struktur data yang lebih canggih untuk menangani masalah yang lebih kompleks dan bisa menyimpan kumpulan data dan object dalam satu tempat.
- **List** 
Menyimpan data secara berbaris yang memiliki index
contoh:
```Dart
void main() async {
    
    var scores = [60, 70, 80, 90, 50]; // membuat list dengan data didalamnya
    print(scores)  ;// output : [60, 70, 80, 90, 50]
    scores.add(100); // menambahkan data kedalam list

    for (var score in scores) {
        print(score);  // menampilkan semua data list
    }

    print("Data pada indeks ke-4: ${scores[5]}"); // output Data pada indeks ke-4: 100

}

```
- **Map** 
menyimpan data secara _key value_ yang berguna selayaknya index pada List
contoh:
```Dart
void main() async {

    var student = { // untuk membuat Map menggunakan {}
        'name' : 'Katan', // name sebgai keys dan katan sebagai value
        'age' : 24 // age sebagai keys dan 24 sebagai value
    };
    print(student); // output {name : 'Katan', age : 24}

    for(var key in student.keys) {
        print(student[key]); // output hanya value 
    }
}
```
