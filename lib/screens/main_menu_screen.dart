import 'package:flutter/material.dart';
import 'settings_screen.dart';
import '/widgets/button.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Guess the number', 
              style: TextStyle(
                fontFamily: 'Public Pixel',
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenWidth * 0.10),
            ImageButton(
              imagePath: 'assets/images/play_button.png',
              size: screenWidth * 0.4,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}