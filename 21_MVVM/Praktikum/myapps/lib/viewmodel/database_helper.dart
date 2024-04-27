import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/view_home.dart';

class DbHelper {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // default login name and password
    prefs.setString('username', "Hashby");
    prefs.setString('password', "Katan123");

    final savedUsername = prefs.getString('username');
    final savedPassword = prefs.getString('password');
    final enteredUsername = usernameController.text.trim();
    final enteredPassword = passwordController.text.trim();

    if (savedUsername == enteredUsername && savedPassword == enteredPassword) {
      // Navigate to ContactPage if login is successful
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ViewContact(
                // username: savedUsername!,
                )),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
