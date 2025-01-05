import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartGame extends GameEvent {
  final int maxNumber;
  final int maxAttempts;
  StartGame(this.maxNumber, this.maxAttempts);
  @override
  List<Object?> get props => [maxNumber, maxAttempts];
}

class GuessNumber extends GameEvent {
  final int guessedNumber;
  GuessNumber(this.guessedNumber);
  @override
  List<Object?> get props => [guessedNumber];
}

class ResetGame extends GameEvent {}
