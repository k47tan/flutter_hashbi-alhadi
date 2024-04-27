import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapps/views/view_home.dart';
import 'package:myapps/views/view_login.dart';

Future<void> main() async {
  runApp(
    GetMaterialApp(
      home: ViewLogin(),
      getPages: [
        GetPage(
          name: '/',
          page: () => ViewLogin(),
        ),
        GetPage(
          name: '/home',
          page: () => ViewContact(),
        ),
      ],
      initialRoute: '/',
    ),
  );
}
