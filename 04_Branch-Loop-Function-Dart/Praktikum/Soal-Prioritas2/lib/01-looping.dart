// 01_Piramida
void piramida(int height) {
  for (int i = height; i > 0; i--) {
    print('  ' * i + '* ' * (2 * (height - i) + 1));
  }
}

// 02_Jam pasir
void jamPasir(int height) {
  for (int i = height; i > 0; i--) {
    print('  ' * (height - i) + ' 0' * (2 * i - 1));
  }
  for (int i = 2; i <= height; i++) {
    print('  ' * (height - i) + ' 0' * (2 * i - 1));
  }
}

void main() {
  piramida(8);
  print('');
  jamPasir(5);
}



