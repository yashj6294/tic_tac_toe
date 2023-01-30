import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game_bloc/game_event.dart';
import 'package:tic_tac_toe/game_bloc/game_state.dart';
import 'package:tic_tac_toe/utils/utils.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  //* Generating list of emtpy string to show on the grid cell.
  static List<List<String>> _gameBoard = List.generate(
    rowSize,
    (index) => List.generate(
      columnSize,
      (index) => "",
    ),
  );

  //* This will keep track of which player's turn is going on currently
  int currentPlayer = 0;
  GameBloc() : super(GameInitial(board: _gameBoard, nextPlayer: 0)) {
    on(
      (event, emit) {
        if (event is GameRestartEvent) {
          //* If it is restart event

          //* Repopulate the list
          _gameBoard = List.generate(
            rowSize,
            (index) => List.generate(columnSize, (index) => ""),
          );

          //* Return back to the initial game state
          emit(GameInitial(board: _gameBoard, nextPlayer: 0));
        } else if (event is PlayerTapped) {
          //* If it is tapping event by player
          int row = event.row;
          int col = event.column;
          //* Checking if the current cell is already tapped or not
          if (_gameBoard[row][col] != "") {
            return;
          }

          //* Getting player info based on the value of the variable currentPlayer.
          Player player = Player.values[currentPlayer % 3];
          _gameBoard[row][col] = mapPlayerToSign[player]!;

          //* Checking if by the current move, anybody become a winner.
          bool isWinner = _checkWinner(mapPlayerToSign[player]!);
          if (isWinner) {
            //* If it is a win, emitting game completed state and setting currentPlayer to 0.
            currentPlayer = 0;
            emit(
              GameCompleted(
                board: _gameBoard,
                nextPlayer: 0,
                winner: player.name,
              ),
            );
          } else {
            //* else incrementing the currentPlayer variable
            currentPlayer++;
            //* Checking if all the cells are covered in the grid or not.
            if (currentPlayer == gridSize) {
              //* If they are, then emitting game completed state.
              currentPlayer = 0;
              emit(GameCompleted(
                  board: _gameBoard, nextPlayer: 0, winner: "Nobody"));
            } else {
              //* Else updating the board in the state and continuing.
              emit(GameOnGoing(board: _gameBoard, nextPlayer: currentPlayer));
            }
          }
        }
      },
    );
  }

//* Function to check the winner in the board.
  bool _checkWinner(String player) {
    //* Checking for 3 consecutive symbols in a column.
    for (int i = 0; i < rowSize - 2; i++) {
      for (int j = 0; j < columnSize; j++) {
        if (_gameBoard[i][j] == player &&
            _gameBoard[i + 1][j] == player &&
            _gameBoard[i + 2][j] == player) {
          return true;
        }
      }
    }

    //* Checking for 3 consecutive symbols in a row.
    for (int i = 0; i < rowSize; i++) {
      for (int j = 0; j < columnSize - 2; j++) {
        if (_gameBoard[i][j] == player &&
            _gameBoard[i][j + 1] == player &&
            _gameBoard[i][j + 2] == player) {
          return true;
        }
      }
    }

    //* Checking all the possible primary diagonals of the board.
    for (int i = 0; i < rowSize - 2; i++) {
      for (int j = 0; j < columnSize - 2; j++) {
        if (_gameBoard[i][j] == player &&
            _gameBoard[i + 1][j + 1] == player &&
            _gameBoard[i + 2][j + 2] == player) {
          return true;
        }
      }
    }

    //* Checking all the possible secondary diagonals of the board.
    for (int i = 0; i < rowSize - 2; i++) {
      for (int j = columnSize - 1; j > 1; j--) {
        if (_gameBoard[i][j] == player &&
            _gameBoard[i + 1][j - 1] == player &&
            _gameBoard[i + 2][j - 2] == player) {
          return true;
        }
      }
    }
    return false;
  }
}
