import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        primaryTextTheme: GoogleFonts.latoTextTheme());


  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark);

}
