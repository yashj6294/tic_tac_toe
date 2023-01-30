import 'package:equatable/equatable.dart';

class GameState extends Equatable {
  final List<List<String>> board;
  final int nextPlayer;
  const GameState({
    required this.board,
    required this.nextPlayer,
  });
  @override
  List<Object?> get props => [board, nextPlayer];
}
//* Initial state of the game.
class GameInitial extends GameState {
  const GameInitial({required super.board, required super.nextPlayer});
}

//* Game is currently going
class GameOnGoing extends GameState {
  const GameOnGoing({required super.board, required super.nextPlayer});
}

//* Game is completed
class GameCompleted extends GameState {
  final String winner;
  const GameCompleted({
    required super.board,
    required super.nextPlayer,
    required this.winner,
  });
}
