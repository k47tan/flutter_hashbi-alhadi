int calculateAverage(List<int> values) =>
    (values.reduce((a, b) => a + b) / values.length).ceil();

void main() {
  List<int> sampleInput = [7, 5, 3, 5, 2, 1];
  
  int result = calculateAverage(sampleInput);

  print("Sample Input: $sampleInput");
  print("Sample Output: $result");
}
