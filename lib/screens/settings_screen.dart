import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'main_menu_screen.dart';
import '/widgets/button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _maxNumberController = TextEditingController();
  final TextEditingController _maxAttemptsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: const Text("Game settings"),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/arrow_icon.png',
            width: screenWidth * 0.06,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainMenuScreen()),
            );
          },
        ),
      ),


      // textfield
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          screenWidth * 0.05, screenWidth * 0.2, screenWidth * 0.05, 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            TextField(
              controller: _maxNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter max number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _maxAttemptsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter the number of attempts",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),

            // button
            ImageButton(
              imagePath: 'assets/images/arrow_button.png',
              size: screenWidth * 0.25,
              onPressed: () {
                final maxNumber = int.tryParse(_maxNumberController.text);
                final maxAttempts = int.tryParse(_maxAttemptsController.text);

                if (maxNumber != null && maxAttempts != null && maxNumber > 0 && maxAttempts > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(
                        maxNumber: maxNumber,
                        maxAttempts: maxAttempts,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter correct values!")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _maxNumberController.dispose();
    _maxAttemptsController.dispose();
    super.dispose();
  }
}
