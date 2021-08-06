import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screen/homepage.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primaryColor: Colors.green.shade900,
      fontFamily: GoogleFonts.roboto().fontFamily),
      home: HomePage(),

    );
  }
}
