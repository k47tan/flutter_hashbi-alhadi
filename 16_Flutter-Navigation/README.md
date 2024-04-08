# Summary

---

- **Navigation**
  Navigation adalah proses perpindahan antar halaman atau layar dalam aplikasi. Flutter menyediakan beberapa widget yang dapat digunakan untuk melakukan navigasi, seperti `Navigator`, `MaterialPageRoute`, dan `PageRouteBuilder`. Navigasi dapat dilakukan dengan beberapa metode, seperti push, pop, pushReplacement, dan lainnya.

  contoh penggunaan push:

  ```dart
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
  );
  ```

  Mengirim Data ke Halaman Lain mengguankan parameter:

  ```dart
  // First Screen
  ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(
            data: 'Hello from the first screen!',
          ),
        ),
      );
    },
    child: Text('Go to Second Screen'),
  ),
  ```

  ```dart
  // Second Screen
    class SecondScreen extends StatelessWidget {
        final String data;

        SecondScreen({required this.data});

        @override
        Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: Text('Second Screen'),
            ),
            body: Center(
            child: Text(data),
            ),
        );
        }
    }
  ```

- **Named Route**
  Named Route adalah cara untuk melakukan navigasi dengan menggunakan nama rute. Named Route memudahkan dalam pengelolaan navigasi dan memisahkan logika navigasi dari widget. Named Route membutuhkan properti `routes` pada widget `MaterialApp` dan properti `onGenerateRoute` untuk menentukan rute yang akan ditampilkan.

  contoh penggunaan Named Route:

  ```dart
  // main.dart
  void main() {
      runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
      return MaterialApp(
          initialRoute: '/',
          routes: {
          '/': (context) => FirstScreen(),
          '/second': (context) => SecondScreen(),
          },
          onGenerateRoute: (settings) {
          if (settings.name == '/third') {
              return MaterialPageRoute(builder: (context) => ThirdScreen());
          }
          },
      );
      }
  }
  ```

  ```dart
  // First Screen
  ElevatedButton(
      onPressed: () {
      Navigator.pushNamed(context, '/second');
      },
      child: Text('Go to Second Screen'),
  ),
  ```

  Mengirim Data ke Halaman Lain menggunakan argument saat melakukan pushNamed:

  ```dart
  // First Screen
  ElevatedButton(
      onPressed: () {
      Navigator.pushNamed(
          context,
          '/second',
          arguments: 'Hello from the first screen!',
      );
      },
      child: Text('Go to Second Screen'),
  ),
  ```

  ```dart
  // Second Screen
  class SecondScreen extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
      final String data = ModalRoute.of(context)!.settings.arguments as String;

      return Scaffold(
          appBar: AppBar(
          title: Text('Second Screen'),
          ),
          body: Center(
          child: Text(data),
          ),
      );
      }
  }
  ```
