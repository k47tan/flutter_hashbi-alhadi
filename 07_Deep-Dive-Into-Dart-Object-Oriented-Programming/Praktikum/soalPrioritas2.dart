// class Math sebagai super-class
class Math {
  // method hasil
  int hasil(){
    return 0;
  }
}

// class KelipatanPersekutuanTerkecil sub-class Math
class KelipatanPersekutuanTerkecil implements Math {
  // property 
  int x;
  int y;
  // constructor
  KelipatanPersekutuanTerkecil(this.x, this.y);

  // method hasil untuk mencari KPK
  @override
  int hasil() {
    return (x * y) ~/ FaktorPersekutanTerbesar(x, y).hasil();
  }
}

// class FaktorPersekutanTerbesar sub-class Math
class FaktorPersekutanTerbesar implements Math {
  // property
  int x;
  int y;
  // constructor
  FaktorPersekutanTerbesar(this.x, this.y);
  // method hasi imp
  @override
  int hasil() {
    while (y != 0) {
      final int temp = y;
      y = x % y;
      x = temp;
    }
    return x;
  }
}

void main() {
  // deklarasi variabel
  int x = 12;
  int y = 18;
  // membuat object
  KelipatanPersekutuanTerkecil KPK = KelipatanPersekutuanTerkecil(x, y);
  FaktorPersekutanTerbesar FPB = FaktorPersekutanTerbesar(x, y);

  print("Kelipatan Persekutuan Terkecil dari $x dan $y adalah: ${KPK.hasil()}");
  print("Faktor Persekutuan Terbesar dari $x dan $y adalah: ${FPB.hasil()}");
}
