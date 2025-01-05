import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/game_bloc.dart';
import '/blocs/game_event.dart';
import '/blocs/game_state.dart';
import 'button.dart';

class GameEndDisplay extends StatelessWidget {
  final GameState state;
  final int maxNumber;
  final int maxAttempts;

  const GameEndDisplay({
    super.key,
    required this.state,
    required this.maxNumber,
    required this.maxAttempts,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final title = state is GameWon ? "You won!" : "You lost!";
    final titleColor = state is GameWon
        ? const Color.fromARGB(255, 19, 206, 26)
        : const Color.fromARGB(255, 81, 81, 81);

    final content = state is GameWon
        ? (0 == maxAttempts - 1
            ? "You guessed the number on the first attempt!"
            : "You guessed the number in ${(state as GameWon).remainingAttempts} attempts")
        : "The hidden number: ${(state as GameLost).correctNumber}";
        
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Text(
          content,
          style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: screenHeight * 0.05),
        ImageButton(
          imagePath: 'assets/images/restart_button.png',
          size: screenWidth * 0.3,
          onPressed: () {
            context.read<GameBloc>().add(StartGame(maxNumber, maxAttempts));
          },
        ),
      ],
    );
  }
}
