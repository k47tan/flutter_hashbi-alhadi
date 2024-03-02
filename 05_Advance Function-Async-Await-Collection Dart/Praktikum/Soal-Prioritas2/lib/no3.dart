Future<int> calculateFactorial(int n) async {
  if (n < 0) {
    throw ArgumentError("Input must be a non-negative integer");
  }

  return List.generate(n, (i) => i + 1).reduce((a, b) => a * b);
}

void main() async {
  int input = 5;

  try {
    int result = await calculateFactorial(input);

    print("Sample Input: $input");
    print("Sample Output: $result");
  } catch (e) {
    print("Error: $e");
  }
}
