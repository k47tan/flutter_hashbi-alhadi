void persegi (double sisi){
  print("Luas persegi = ${sisi * sisi}");
  print("Keliling persegi = ${sisi * 2}");
}

void persegiPanjang(double panjang, double lebar){
  print("Luas persegi panjang = ${panjang * lebar}");
  print("Keliling persegi panjang = ${(panjang + lebar) * 2}");
}
void main(){
  persegi(5);
  persegiPanjang(5,4);
}