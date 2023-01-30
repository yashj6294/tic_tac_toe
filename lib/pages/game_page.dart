import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game_bloc/game_bloc.dart';
import 'package:tic_tac_toe/game_bloc/game_state.dart';
import 'package:tic_tac_toe/pages/board_cell.dart';
import 'package:tic_tac_toe/pages/dialogs.dart';
import 'package:tic_tac_toe/utils/utils.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //* User pressed the back button in the game screen.
        showBackDialog(context);
        return false;
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: BlocBuilder<GameBloc, GameState>(
                builder: (context, state) {
                  if (state is GameCompleted) {
                    //* If game is completed, then showing the winner dialog.
                    WidgetsBinding.instance.addPostFrameCallback(
                        (timeStamp) => showWinDialog(context, state.winner));
                  }

                  List<List<String>> board = state.board;
                  int currentPlayer = (state.nextPlayer + 1) % 3 == 0
                      ? 3
                      : (state.nextPlayer + 1) % 3;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Player $currentPlayer's turn",
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columnSize,
                        ),
                        itemBuilder: (context, index) {
                          return BoardCell(
                            row: index ~/ columnSize,
                            column: index % columnSize,
                            value: board[index ~/ columnSize][index % columnSize],
                          );
                        },
                        itemCount: gridSize,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
