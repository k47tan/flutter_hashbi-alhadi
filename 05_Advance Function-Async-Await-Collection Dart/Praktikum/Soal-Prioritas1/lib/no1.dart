Future<List<int>> multiplyList(List<int> dataList, int multiplier) async {
  return Future.wait(dataList.map((int element) async {
    await Future.delayed(Duration(seconds: 3));

    return element * multiplier;
  }));
}

void main() async {

  List<int> dataList = [1, 2, 3, 4, 5];
  int multiplier = 5;

  print("Original List: $dataList");

  List<int> result = await multiplyList(dataList, multiplier);

  await Future.delayed(Duration(seconds: 5));

  print("Multiplied List: $result");
}
