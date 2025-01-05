import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_num_test_task/screens/settings_screen.dart';
import '/blocs/game_bloc.dart';
import '/blocs/game_event.dart';
import '/blocs/game_state.dart';
import '/widgets/attempts_display.dart';
import '/widgets/game_end_display.dart';

class GameScreen extends StatefulWidget {
  final int maxNumber;
  final int maxAttempts;
  const GameScreen({super.key, required this.maxNumber, required this.maxAttempts});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Guess number"),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/arrow_icon.png',
            width: screenWidth * 0.06,
          ),
          
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
          },
        ),
      ),


      body: BlocProvider(
        create: (_) => GameBloc()..add(StartGame(widget.maxNumber, widget.maxAttempts)),
        child: BlocConsumer<GameBloc, GameState>(
          listener: (context, state) {},
          builder: (context, state) {
            // background color change
            Color backgroundColor;
            if (state is GameWon) {
              backgroundColor = const Color.fromARGB(255, 255, 243, 138);
            } else if (state is GameLost) {
              backgroundColor = const Color.fromARGB(51, 0, 0, 0);
            } else {
              backgroundColor = Colors.transparent;
            }

            return Container(
              color: backgroundColor,
              height: screenHeight,
              width: screenWidth,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // attempts left
                    AttemptsDisplay(
                      remainingAttempts: state is GameInProgress
                          ? state.remainingAttempts
                          : state is GameWon
                              ? (widget.maxAttempts - state.remainingAttempts)
                              : 0,
                    ),
                    const SizedBox(height: 20),

                    // feedback
                    if (state is GameInProgress && state.message != null)
                      Text(
                        state.message!,
                        style: TextStyle(
                          fontSize: screenWidth * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),

                    const SizedBox(height: 20),

                    // guess input
                    if (state is GameInProgress)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Enter your guess',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          onSubmitted: (value) {
                            final guessedNumber = int.tryParse(value);
                            if (guessedNumber != null && guessedNumber > 0) {
                              context.read<GameBloc>().add(GuessNumber(guessedNumber));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please enter a natural number")),
                              );
                            }
                          },
                        ),
                      )
                    else
                      GameEndDisplay(
                        state: state,
                        maxNumber: widget.maxNumber,
                        maxAttempts: widget.maxAttempts,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
