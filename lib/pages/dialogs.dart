import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game_bloc/game_bloc.dart';
import 'package:tic_tac_toe/game_bloc/game_event.dart';

//* Dialog to show the winner of the game.
void showWinDialog(BuildContext context, String winner) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          " $winner is Winner!!!",
          style: const TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 24.0,
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              "Return to home",
              style: TextStyle(
                  fontFamily: 'Ubuntu', fontSize: 14.0, color: Colors.red),
            ),
            onPressed: () {
              BlocProvider.of<GameBloc>(context).add(GameRestartEvent());
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text(
              "Play again",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 14.0,
                color: Colors.green,
              ),
            ),
            onPressed: () {
              BlocProvider.of<GameBloc>(context).add(GameRestartEvent());
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

//* Dialog to confirm back operation by the user.
void showBackDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text(
        " Are you sure, you want to leave the game ?",
        style: TextStyle(
          fontFamily: 'Ubuntu',
          fontSize: 24.0,
        ),
      ),
      actions: [
        TextButton(
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 14.0,
              color: Colors.red,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text(
            "Yes",
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 14.0,
              color: Colors.green,
            ),
          ),
          onPressed: () {
            BlocProvider.of<GameBloc>(context).add(GameRestartEvent());
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
