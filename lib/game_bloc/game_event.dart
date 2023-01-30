import 'package:equatable/equatable.dart';

class GameEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
//* Event to restart the game.
class GameRestartEvent extends GameEvent {}

//* Event to notify that a player tapped.
class PlayerTapped extends GameEvent {
  final int row, column;
  PlayerTapped({
    required this.column,
    required this.row,
  });
}
