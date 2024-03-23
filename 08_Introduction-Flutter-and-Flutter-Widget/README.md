# Summary

#### Introduction Flutter and Flutter Widget
flutter adalah sebuah framework yang dibuat oleh google untuk membangun aplikasi mobile, web, dan desktop dengan menggunakan bahasa pemrograman ___Dart___. Flutter memiliki widget yang dapat digunakan untuk membangun aplikasi yang beragam. Widget adalah sebuah komponen yang dapat digunakan untuk membangun aplikasi, widget dapat berupa widget yang sudah disediakan oleh flutter atau widget yang dibuat sendiri.

#### Widget
Widget adalah sebuah komponen yang dapat digunakan untuk membangun aplikasi, widget dapat berupa widget yang sudah disediakan oleh flutter atau widget yang dibuat sendiri. Flutter memiliki dua jenis widget yaitu StatelessWidget dan StatefullWidget. Stateless widget digunakan ketika value (state / data) dari widget tersebut tidak pernah berubah, sedangkan StatefullWidget digunakan ketika value (state / data) dari widget tersebut dapat berubah.

#### Stateless Widget
Stateless widget digunakan ketika value (state / data) dari widget tersebut tidak pernah berubah. Stateless widget hanya memiliki satu method yaitu build(). Method build() digunakan untuk mengembalikan widget yang akan ditampilkan. Stateless widget tidak memiliki state (data) yang dapat berubah.

#### Statefull Widget
StatefullWidget digunakan ketika value (state / data) dari widget tersebut dapat berubah. StatefullWidget memiliki dua method yaitu build() dan createState(). Method build() digunakan untuk mengembalikan widget yang akan ditampilkan, sedangkan method createState() digunakan untuk membuat state dari widget tersebut. StatefullWidget memiliki state (data) yang dapat berubah.