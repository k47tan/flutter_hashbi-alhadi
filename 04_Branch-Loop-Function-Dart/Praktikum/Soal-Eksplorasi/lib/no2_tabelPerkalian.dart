void printMultiplicationTable(int angka) {
  for (int i = 1; i <= angka; i++) {
    String baris = ' ';
    for (int j = 1; j <= angka; j++) {
      int hasil = i * j;
      baris += '$hasil\t';
    }
    print(baris);
  }
}

void main() {
  printMultiplicationTable(9);
}
