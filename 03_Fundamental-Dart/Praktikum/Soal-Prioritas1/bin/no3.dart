void names (String firstName,[String? lastName]) {
  print("Hello $firstName $lastName");
}
void main() {
  names("katan"); /// lastname nullable jadi tidak akan menampilkan eroor jika tidak diisi
  names("Hashbi","Alhadi");
}
