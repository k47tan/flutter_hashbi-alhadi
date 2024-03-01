// mengecek bilangan prima
bool prima(int number) {
  if (number <= 1) return false;
  
  for (int i = 2; i < number; i++) {
    if (number % i == 0) return false;
  }

  return true;
}

void main() {
  int number1 = 23;
  int number2 = 12;
  
  if (prima(number1)) {
    print("$number1 adalah bilangan prima");
  } else { 
    print("$number1 bukan bilang prima");
  }

  if (prima(number2)) {
    print("$number2 adalah bilangan prima");
  } else { 
    print("$number2 bukan bilang prima");
  }
}