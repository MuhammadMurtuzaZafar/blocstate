import 'package:flutter/material.dart';


class Themes {
  final lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      secondary: Colors.orange,
    ),
    primaryColor: Colors.blue,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      // foregroundColor: Colors.black,
      // backgroundColor: Colors.grey.shade300,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.orange,
    ),

  );

  final dartTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade800,
      secondary: Colors.orange,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
    ),
    primaryColor: Colors.blue,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.orange,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      // foregroundColor: Colors.white,
      // backgroundColor: Colors.teal.shade500,
    ),
  );
}

