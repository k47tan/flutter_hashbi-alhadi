class Calculator{
  int number1;
  int number2;
  int? result;

  Calculator(this.number1, this.number2);

  // Method pertambahan
  void add() {
    result = number1 + number2;
  }

  // Method pengurangan
  void subtract() {
    result = number1 - number2;
  }

  // Method perkalian 
  void multiply() {
    result = number1 * number2;
  }

  // Method pembagian
  void divide() {
    result = number1 ~/ number2; // Gunakan operator ~/ untuk pembagian integer
  }
}

void main() {
  Calculator calc = Calculator(10, 5);
  calc.add();
  print("${calc.number1} + ${calc.number2} = ${calc.result}");
  
  calc.subtract();
  print("${calc.number1} - ${calc.number2} = ${calc.result}");
  
  calc.multiply();
  print("${calc.number1} * ${calc.number2} = ${calc.result}");
  
  calc.divide();
  print("${calc.number1} / ${calc.number2} = ${calc.result}");
}
