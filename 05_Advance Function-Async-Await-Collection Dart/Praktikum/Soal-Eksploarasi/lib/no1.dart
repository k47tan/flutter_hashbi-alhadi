List<String> removeDuplicates(List<String> inputList) => inputList.toSet().toList();

void main() {

  List<String> sampleInput1 = ["amuse", "tommy kaira", "spoon", "HKS", "litchfield", "amuse", "HKS"];
  List<String> sampleInput2 = ["JS Racing", "amuse", "spoon", "spoon", "JS Racing", "amuse"];

  print("Sample Input 1: $sampleInput1");
  print("Sample Output 1: ${removeDuplicates(sampleInput1)}");

  print("\nSample Input 2: $sampleInput2");
  print("Sample Output 2: ${removeDuplicates(sampleInput2)}");

}
