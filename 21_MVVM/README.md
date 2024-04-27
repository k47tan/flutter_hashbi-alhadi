# Summary

---

##### MVVM (Model-View-ViewModel)

Model-View-ViewModel (MVVM) adalah arsitektural yang memisahkan tampilan dengan proses bisnis. Konsep MVVM memisahkan tampilan (_View_) dengan proses bisnis (_Model_). MVVM menggunakan _ViewModel_ sebagai penghubung antara _View_ dan _Model_. _ViewModel_ berfungsi untuk mengatur data yang akan ditampilkan pada _View_.
Keuntungan penggunaan MVVM:

- Reusable: Memisahkan tampilan dengan proses bisnis membuat kode lebih reusable. Jika ada tampilan yang memerlukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama.
- Maintainable: Memisahkan tampilan dengan proses bisnis membuat kode lebih mudah di maintain. Jika ada perubahan pada proses bisnis, kita hanya perlu mengubah ViewModel tanpa merubah tampilan.
- Testable: Memisahkan tampilan dengan proses bisnis membuat kode lebih mudah di test. Kita bisa membuat unit test pada ViewModel tanpa perlu menampilkan tampilan.

Sturktur MVVM:

- Model: Berisi data dan proses bisnis.
- View: Berisi tampilan yang akan ditampilkan pada pengguna.
- ViewModel: Berisi data yang akan ditampilkan pada View dan logic yang digunakan pada View.
