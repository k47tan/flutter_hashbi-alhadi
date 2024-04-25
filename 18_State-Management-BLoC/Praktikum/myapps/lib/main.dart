import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapps/blocs/bloc_contact.dart';
import 'package:myapps/views/view_addcontact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.blue,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle: GoogleFonts.roboto(
              fontSize: 30,
            ),
          ),
        ),
        // home: ViewHome(),
        initialRoute: '/',
        routes: {
          '/': (context) => const ViewContact(),
          // '/gallery': (context) => const ViewGallery(),
        },
      ),
    );
  }
}
