String check(String word) {
  word = word.replaceAll(" ", "").toLowerCase(); 
  String reverseword = word.split('').reversed.join(); 

  if (word == reverseword) {
    return "palindrom";
  } else {
    return "bukan palindrom";
  }
}
void main() {
  String inputWord = 'mobil balap'; // 
  String hasil = check(inputWord);
  print(hasil);
}

