# Summary
---

### Branch
**if** merupakan kondisi awal alur program untuk mengecek kondisi *true* atau *false*. Jika kondisinya false maka akan dijalankan blok **else**.
contoh:
```Dart
void main() {

    var usia = 18
    if (usia <> 20) {
        print('Remaja');// jika true, maka akan menghasilkan output remaja
    }
}
```
**else** dijalankan ketika **if** bernilai false
contoh:
```Dart
void main() {

    var usia = 23
    if (usia < 20) {
        print('Remaja');// jika true, maka akan menghasilkan output remaja
    } else {
        print('Dewasa'); // output dewasa 
    }
}
```
**else-if** jika memiliki beberapa kondisi
contoh:
```Dart
void main() {

    var usia = 23
    if (usia < 12) {
        print('Anak-Anak');// jika true, maka output anak-anak
    } else if (usia < 20) {
        print('Remaja'); // jika true, output remaja 
    } else {
        print('Dewasa'); // output dewasa
    }
}
```
**Switch statement**, adalah alternatif dari _if-else_ yang menyederhanakan kondisi multiple, untuk pemilihan kondisi berdasarkan nilai.
contoh:
```Dart
void main() {

    var nilai = 'A';
    Switch (nilai) {
        case 'A':
            print("Sangat Baik");
            break;
        case 'B':
            print("Baik");
            break;
        case 'C':
            print("Cukup");
        default:
            print("Nilai Tidak valid");
    }
}
```

### Looping
- **for**
memerlukan nilai awal, nilai bool untuk berjalan (_true_) atau (_false_) nilai akhir yang akan dihentikan dan pengubah nilai awal.
contoh:
```Dart
void main() {

    for(var i = 0; i < 10; i++){ // var i = 0 adalah nilai awal, i < 10 adalah nilai boolean (perulanagan), i++ adalah penghubah nilai awal  
        print(i); // 
    }

}
```
- **for loop with list**
perulangan yang mengakses sebuah list yang terdiri dari index dan elemen yang diakses secara berurutan dan menghasilkan output yang dapat mengubah nilai dalam list atau menghitung total nilai
contoh:
```Dart
void main() {

    List<String> fruits = ['Apple', 'Banana', 'Manggo', 'Orange'];

    for (int i = 0; i < fruits.length; i++) {
        print('Buah ke-${fruits[i]}');
    }
}
```
- **for in loop**
perulangan yang mengakses sebuah list yang lansung ke elemen tidak perlu index, code lebih _bersih_, _singkat_ dan lebih ideal untuk koleksi.
contoh:
```Dart
void main() {

    List<String> names = ['Hashbi', 'Shifa', 'Putri', 'Ageng'];

    for (String name in names) {
        print(name);
    }
}
```
- **do while**
**while** memerlukan nilai boolean, **do** proses akan dijalankan sekali, dan akan diteruskan jika nilai bool adalah _true_
contoh:
```Dart
void main() {

    var i = 0;
    do {
        print(i);
        i++;
    } while (i < 10);
}
```

- **Break dan Continue**
**Break** dapat menghentikan perulangan dengan mengambaikan nilai boolean sedangkan **Continue** dapar menghentikan satu kali proses lalu lanjut untuk berikutnya.
contoh:
```Dart
void  main() {

    for (var i = 0; true; i++) {
        if (i == 5) {
            break;// jika nilai 5 maka perulangan akan berhenti
        }
        print(i);
    }
}
```
```Dart
void  main() {

    for (var i = 0; 1 <= 10; i+=1) {
        if (i == 5) {
            continue;// jika nilai 5 maka perulangan dilewati
        }
        print(i); // output 1, 2, 3, 4, 6, 7, 8 , 9, 10
    }
}
```

### Function
kumpulan perintah yang dapat digunakan berkali-kali, jika mengubah fungsi sekali makan penggunaan yang lain akan ikut berubah.
contoh:
```Dart
void name() { // membuat function
    print('katan');
}

void main() {
    name(); // memanggil function
}
```
- **Function dengan Parameter**
mengirim data saat menjalankan function
contoh:
```Dart
void name(String names) { // String sebagai tipe data, dan names sebagai parameter

    print('halo $names');

}

void main() {

    name('katan'); // memanggil function dengan memasukan value parameter

}
```
- **Function dengan Return**
memberi nilai ketika function dipanggil
contoh:
```Dart
int numbers(int a, int b) { // int sebagai tipe data, dan a, b sebagai parameter
    return a + b; // memberikan nilai kembali

}

void main() {
    
    var result = numbers(1, 2); // memanggil function dan menerima hasilnya ke variable result
    print(result); // output setelah nilai dikembalikan

}
```
### try Catch Finally
Menangani error saat runtime, menjalankan kode pembersihan dan mencegah aplikasi crash.
- **try** adalah blok kode yang dijalankan dan dipantau untuk eksepsi (_error_)
- **catch** adalah blok kode yang dijalankan untuk menangani error yang terjadi pada blok _try_. (e, s) untuk mendapatkan objek StackTrace
- **finally** adalah blok kode yang dijalakan setelah _try_ dan _catch_, yang digunakan untuk membersihkan sumber daya, seperti menutup files atau database.
contoh:
```Dart
try {
    var result = 100 ~/ 0;
} catch (e) {
    print("terjadi error : $e"); // output, Eksepsi: IntegerDivisionByZeroException
} finally {
    print("Operasi selesai"); // output, Operasi selesai
}
```