# Summary

---

_Declarative UI_ adalah teknik untuk membuat _User Interface_ (UI) dengan mendeklarasikan bagaimana tampilan aplikasi seharusnya terlihat berdasarkan _state_ aplikasi. Dengan teknik ini, kita tidak perlu memikirkan bagaimana cara mengubah tampilan aplikasi ketika _state_ berubah, karena Flutter akan secara otomatis memperbarui tampilan aplikasi sesuai dengan _state_ yang ada.
_state_ adalah ketika sebuah widget yang sedang aktif dan menyimpan data di memory.
ada 2 jenis state yaitu:

1. _ephemeral_ state, yaitu state yang hanya berlaku pada satu widget saja. Tidak perlu state management untuk mengelola state ini, hanya membutuhkan `setState` untuk mengubah state. contohnya: ketika kita ingin mengubah warna background dari sebuah widget ketika di tekan.
2. _app_ state, yaitu state yang berlaku secara global pada aplikasi. State ini membutuhkan state management untuk mengelola state ini. contohnya: ketika kita ingin mengambil data dari server dan menyimpannya di memory aplikasi.

##### BLoC

BLoC (Business Logic Component) adalah sebuah design pattern yang digunakan untuk memisahkan _business logic_ dari _User Interface_ (UI) pada aplikasi Flutter. Dengan BLoC, _business logic_ aplikasi dipisahkan dari UI sehingga memudahkan dalam pengelolaan kode dan memungkinkan untuk melakukan _testing_ secara terpisah.
BLoC terdiri dari tiga bagian utama:

1. **_Stream_**: adalah _sequence_ dari data yang di-_broadcast_ ke beberapa _listener_. Dengan _Stream_, kita bisa mengirimkan data dari satu tempat ke tempat lain secara _asynchronous_.
2. **_Sink_**: adalah _receiver_ dari data yang dikirimkan melalui _Stream_. Dengan _Sink_, kita bisa menambahkan data ke dalam _Stream_.
3. **_Bloc_**: adalah _component_ yang menghubungkan _Stream_ dan _Sink_. _Bloc_ menerima data dari _Sink_, memproses data tersebut, dan mengirimkan hasilnya ke _Stream_.

##### Cara Kerja BLoC

1. _Event_ dikirimkan ke _Bloc_ melalui _Sink_.
2. _Bloc_ memproses _Event_ tersebut dan mengirimkan _State_ baru ke _Stream_.
3. _Widget_ yang menggunakan _Bloc_ akan mendengarkan _State_ dari _Stream_ dan memperbarui tampilan sesuai dengan _State_ yang diterima.

##### Install BLoC

1. Pada terminal ketikkan perintah berikut:

```bash
$ flutter pub add bloc
```

uqutable adalah package untuk mencegah adanya rebuild yang tidak perlu pada widget

```bash
$ flutter pub add equatable
```

untuk menambahkan kedalam dependecies pada file `pubspec.yaml`

```bash
$ flutter pub get
```
