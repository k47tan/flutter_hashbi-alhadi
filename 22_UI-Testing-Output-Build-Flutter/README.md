# Summary

---

#### UI Testing

UI Testing adalah salah satu metode pengujian perangkat lunak yang bertujuan untuk menguji antarmuka pengguna (UI) dari aplikasi. UI Testing Output Build Flutter adalah hasil dari pengujian UI yang dilakukan pada aplikasi Flutter. Pengujian ini dilakukan untuk memastikan bahwa aplikasi yang dibuat berjalan dengan baik dan sesuai dengan yang diinginkan. Hasil dari pengujian ini berupa laporan yang berisi hasil pengujian dan rekomendasi perbaikan yang perlu dilakukan. Dengan adanya laporan ini, pengembang dapat mengetahui apakah aplikasi yang dibuat sudah sesuai dengan standar yang diinginkan atau masih perlu diperbaiki.

#### Melakukan UI Testing

1. Dilakukan pada folder test dan nama file test harus diikuti dengan kata test(contact_test.dart).
2. Menulias kode test dengan menggunakan widget tester.
   contoh kode test:

```dart
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
```

Test case diawali dengan testWidgets, kemudian diikuti dengan nama test case dan kode test yang akan dijalankan. Pada kode test diatas, dilakukan pengujian terhadap aplikasi MyApp. Pertama, dilakukan pengecekan apakah teks '0' ada pada aplikasi. Jika ada, maka test akan berhasil. Selanjutnya, dilakukan pengecekan apakah teks '1' tidak ada pada aplikasi. Jika tidak ada, maka test akan berhasil. Kemudian, dilakukan simulasi tap pada icon '+' dan trigger frame. Setelah itu, dilakukan pengecekan apakah teks '0' tidak ada pada aplikasi. Jika tidak ada, maka test akan berhasil. Selanjutnya, dilakukan pengecekan apakah teks '1' ada pada aplikasi. Jika ada, maka test akan berhasil.

3. Menjalankan test dengan perintah flutter test.
