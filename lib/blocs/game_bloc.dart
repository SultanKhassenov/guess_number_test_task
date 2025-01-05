import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  int? _correctNumber;
  int? _remainingAttempts;
  int? _maxAttempts;

  GameBloc() : super(GameInitial()) {
    on<StartGame>(_onStartGame);
    on<GuessNumber>(_onGuessNumber);
    on<ResetGame>(_onResetGame);
  }

  void _onStartGame(StartGame event, Emitter<GameState> emit) {
    _correctNumber = Random().nextInt(event.maxNumber) + 1;
    _remainingAttempts = event.maxAttempts;
    _maxAttempts = event.maxAttempts;
    emit(GameInProgress(remainingAttempts: _remainingAttempts!));
  }

  void _onGuessNumber(GuessNumber event, Emitter<GameState> emit) {
    if (_correctNumber == null || _remainingAttempts == null) return;

    _remainingAttempts = _remainingAttempts! - 1;
    if (event.guessedNumber == _correctNumber) {
      final usedAttempts = _maxAttempts! - _remainingAttempts!;
      emit(GameWon(usedAttempts));
    } else if (_remainingAttempts! > 0) {
      String message = event.guessedNumber > _correctNumber!
          ? "X < ${event.guessedNumber}"
          : "X > ${event.guessedNumber}";
      emit(GameInProgress(remainingAttempts: _remainingAttempts!, message: message));
    } else {
      emit(GameLost(_correctNumber!));
    }
  }

  void _onResetGame(ResetGame event, Emitter<GameState> emit) {
    _correctNumber = null;
    _remainingAttempts = null;
    emit(GameInitial());
  }
}
