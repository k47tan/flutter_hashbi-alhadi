void countDataTypes(List<dynamic> data) {
  int stringCount = 0;
  int boolCount = 0;
  int intCount = 0;
  int doubleCount = 0;

  for (var element in data) {
    if (element is String) {
      stringCount++;
    } else if (element is bool) {
      boolCount++;
    } else if (element is int) {
      intCount++;
    } else if (element is double) {
      doubleCount++;
    }
  }

  print("String count: $stringCount");
  print("Bool count: $boolCount");
  print("Int count: $intCount");
  print("Double count: $doubleCount");
}

void main() {
  List<dynamic> data = [6, 8, 2000, "Hashbi", 2.13, 4.69, true, "katan", 100, false, 4.5, "Alhadi"];
  
  countDataTypes(data);
}
