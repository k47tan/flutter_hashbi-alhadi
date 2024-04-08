# Summary

---

- **Assets**
  Assets adalah file yang digunakan dalam aplikasi Flutter, seperti gambar, font, dan file konfigurasi lainnya. Assets dapat berupa file lokal atau file yang diambil dari internet. Untuk menggunakan assets di Flutter, kita perlu mendefinisikan path file tersebut di file `pubspec.yaml`.

  contoh penggunaan assets di `pubspec.yaml`:

  ```yaml
  assets:
    - assets/images/
    - assets/fonts/
  ```

- **Image**
  Image adalah widget yang digunakan untuk menampilkan gambar. Image memiliki beberapa constructor, seperti `Image.asset()`, `Image.network()`, dan `Image.file()`.

  contoh penggunaan Image:

  ```dart
  Image.asset('assets/images/logo.png')
  ```

- **Vector**
  Vector adalah gambar yang menggunakan path dan garis untuk menggambar gambar. Vector memiliki beberapa keunggulan, seperti tidak kehilangan kualitas saat diperbesar. Untuk menggunakan vector di Flutter, kita dapat menggunakan package `flutter_svg`.

  contoh penggunaan `flutter_svg`:
  Membutuhkan package `flutter_svg` di `pubspec.yaml` atau menggunakan Command `flutter pub add flutter_svg`.

  ````yaml
  ```dart
  SvgPicture.asset('assets/images/logo.svg')
  ````

- **Font**
  Font adalah jenis huruf yang digunakan dalam aplikasi. Font dapat diubah dengan menggunakan package `google_fonts`.

  contoh penggunaan `google_fonts`:
  Membutuhkan package `google_fonts` di `pubspec.yaml` atau menggunakan Command `flutter pub add google_fonts`. Atau menggunkan costum font yang telah di download dengan menambahkan file font di folder `assets/fonts/`.

  ````yaml
  ```dart
  GoogleFonts.poppins()
  ````
