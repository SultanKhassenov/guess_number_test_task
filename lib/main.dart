import 'package:flutter/material.dart';
import 'screens/main_menu_screen.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenuScreen(),
      theme: AppTheme.getLightTheme(screenWidth),
    );
  }
}
