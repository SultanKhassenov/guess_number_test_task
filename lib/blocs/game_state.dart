import 'package:equatable/equatable.dart';

abstract class GameState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GameInitial extends GameState {}

class GameInProgress extends GameState {
  final int remainingAttempts;
  final String? message;
  GameInProgress({required this.remainingAttempts, this.message});
  @override
  List<Object?> get props => [remainingAttempts, message];
}

class GameWon extends GameState {
  final int remainingAttempts;
  GameWon(this.remainingAttempts);
  @override
  List<Object?> get props => [remainingAttempts];
}

class GameLost extends GameState {
  final int correctNumber;
  GameLost(this.correctNumber);
  @override
  List<Object?> get props => [correctNumber];
}
