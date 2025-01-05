import 'package:flutter/material.dart';

class AttemptsDisplay extends StatelessWidget {
  final int remainingAttempts;
  const AttemptsDisplay({super.key, required this.remainingAttempts});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.05),
        decoration: BoxDecoration(
          color: const Color.fromARGB(47, 0, 0, 0),
          border: Border.all(color: const Color.fromARGB(80, 69, 69, 69), width: 10),
        ),
        child: Text(
          "$remainingAttempts",
          style: TextStyle(
            fontSize: screenWidth * 0.15,
            color: remainingAttempts <= 3 ? Colors.red : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
