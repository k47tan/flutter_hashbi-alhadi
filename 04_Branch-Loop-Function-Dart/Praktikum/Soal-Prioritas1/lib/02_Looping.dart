
void main() {
  // 01_Tampilkan nilai 1 - 10 pada layar dengan menggunakan perulangan!
  for(int i = 1; i <= 10; i++) {
    print(i);
  }

// 02 Terdapat nilai list dengan data antara lain 'Apple', 'Banana', 'Avocado', 'Cherry', 'Mango', 'Apricot', 'Blueberry', 'Acerola', 'Grape', 'Almond'
// Berdasarkan data diatas tampilkan semua data yang diawali dengan karakter A
// Menggunakan salah satu teknik for yakni for loop in
// Gunakan method startsWith untuk mengecek karakter pertama
  List<String> fruit = ['Apple', 'Banana', 'Avocado', 'Cherry', 'Mango', 'Apricot', 'Blueberry', 'Acerola', 'Grape', 'Almond'];
  for(String fruits in fruit ) {
    if(fruits.startsWith('A')) {
      print(fruits);
    }
  }
}
