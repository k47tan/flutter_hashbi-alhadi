void main() {
  int inputBilangan = int.parse('24'); 
  List<int> faktorBilangan = cariFaktor(inputBilangan);

  print("Faktor dari $inputBilangan adalah: $faktorBilangan");
}

List<int> cariFaktor(int bilangan) {
  List<int> faktor = [];

  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      faktor.add(i);
    }
  }

  return faktor;
}
