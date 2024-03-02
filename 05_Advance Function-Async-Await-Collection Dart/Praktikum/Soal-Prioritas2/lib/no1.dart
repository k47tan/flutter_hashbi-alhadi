void main() {

  List<List<dynamic>> nestedList = [
    ["Anggur", 10],
    ["Pisang", 7],
    ["Melon", 4],
    ["jambu", 9],
  ];

  Map<String, int> fruitCountMap = Map.fromIterable(
    nestedList,
    key: (item) => item[0],
    value: (item) => item[1],
  );

  print("Fruit Count Map: $fruitCountMap");
}
