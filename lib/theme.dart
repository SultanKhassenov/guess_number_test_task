import 'package:flutter/material.dart';

Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: AppTheme.getLightTheme(screenWidth),
  );
}

class AppTheme {
  static ThemeData getLightTheme(double screenWidth) {
    return ThemeData(
      fontFamily: 'Public Pixel',

      // Input style
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.04,
          horizontal: screenWidth * 0.03,
        ),
        labelStyle: TextStyle(
          color: const Color.fromARGB(255, 112, 112, 112),
          fontSize: screenWidth * 0.027,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 184, 218, 99),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color.fromARGB(255, 112, 112, 112),
      ),

      // Body color and appbar style
      scaffoldBackgroundColor: const Color.fromARGB(255, 162, 194, 97),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromARGB(37, 0, 0, 0),
        titleTextStyle: TextStyle(
          color: const Color.fromARGB(255, 41, 41, 41),
          fontFamily: 'Public Pixel',
          fontSize: screenWidth * 0.04,
        ),
        
      ),
    );
  }
}
