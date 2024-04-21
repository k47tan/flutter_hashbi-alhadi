import 'package:flutter/material.dart';
import 'package:myapps/controller/controller_contact.dart';
import 'package:myapps/controller/controller_image.dart';
import 'package:myapps/controller/controller_text.dart';
import 'package:myapps/views/view_contact.dart';
import 'package:myapps/views/view_galery.dart';
import 'package:myapps/views/views_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContactController()),
        ChangeNotifierProvider(create: (context) => ImageController()),
        ChangeNotifierProvider(create: (context) => NameEditingController()),
        ChangeNotifierProvider(create: (context) => NumberEditingController()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.blue,
            titleTextStyle: GoogleFonts.roboto(
              fontSize: 20,
              letterSpacing: 3.0,
              color: Colors.black,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const ViewContacts(),
          '/gallery': (context) => const ViewGallery(),
          '/formContact': (context) => const AddContact(),
        },
      ),
    );
  }
}
