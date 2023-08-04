import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.lato().fontFamily,
        cardColor: Colors.white,
        canvasColor: cream,
        colorScheme: ColorScheme(brightness:Brightness.light, primary: Colors.black, onPrimary: darkCream, secondary: Colors.black, onSecondary: Colors.black, error: red,
        onError: red, background: Colors.white, onBackground: Colors.white, surface:yellow, onSurface: darkCream),
        buttonTheme: ButtonThemeData(buttonColor: Colors.amber),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.amber),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        primaryTextTheme: GoogleFonts.latoTextTheme());


  static ThemeData darkTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.lato().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkCream,
    colorScheme: ColorScheme(brightness:Brightness.dark, primary: Colors.white, onPrimary: Colors.white, secondary: Colors.black, onSecondary: Colors.white, error: red,
    onError: red, background: cream, onBackground: darkCream, surface:yellow, onSurface: cream),
    buttonTheme: ButtonThemeData(buttonColor: yellow),
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: yellow),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    primaryTextTheme: GoogleFonts.latoTextTheme());
  

  static Color darkCream = Color.fromARGB(255, 37, 37, 37);
  static Color red = Color.fromARGB(255,244, 67, 54);
  static Color blue = Color.fromARGB(255,68, 138, 255);
  static Color cream = Color.fromARGB(255,237, 237, 233);
  static Color yellow = Colors.amber;

}
