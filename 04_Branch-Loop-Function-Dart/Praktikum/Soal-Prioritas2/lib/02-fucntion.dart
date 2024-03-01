// 01_Buatlah sebuah function dengan parameter untuk menghitung luas lingkaran. Kemudian function lingkaran tersebut dijalankan pada function main!
void lingkaran(double jariJari) {
  const double pi = 3.14;

  print("Luas lingkaran = ${pi * (jariJari * jariJari)}");
}

// Buatlah sebuah function yang dapat menampilkan faktorial dari nilai-nilai di bawah ini: 10, 40 , 50
void factorial(List<int> numbers) {
  int calculateFactorial(int number) => (number == 0 || number == 1) ? 1 :  number * calculateFactorial(number - 1);
  
  for (int number in numbers) {
    int factorial = calculateFactorial(number);
    print("Faktorial dari $number adalah: $factorial");
  }
}
void main() {
  lingkaran(5);
  print('');
  List<int> values = [10, 40, 50];
  factorial(values);
}