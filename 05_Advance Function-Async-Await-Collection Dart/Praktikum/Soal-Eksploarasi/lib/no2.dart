void calculateFrequency(List<String> dataList) {
  Map<String, int> frequencyMap = {};

  dataList.forEach((data) => frequencyMap[data] = (frequencyMap[data] ?? 0) + 1);

  frequencyMap.forEach((key, value) => print("$key: $value"));
}

void main() {
  List<String> sampleInput = ["js", "js", "js", "golang", "python", "js", "js", "golang", "rust"];

  print("Sample Input: $sampleInput");
  print("\nSample Output:");

  calculateFrequency(sampleInput);
}
