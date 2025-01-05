import 'package:flutter/material.dart';

class GuessInput extends StatelessWidget {
  final Function(String) onSubmitted;
  const GuessInput({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Enter X",
          errorText: null,
        ),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
