import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/game_bloc/game_bloc.dart';
import 'package:tic_tac_toe/game_bloc/game_event.dart';

class BoardCell extends StatelessWidget {
  final int row, column;
  final String value;
  const BoardCell({
    super.key,
    required this.column,
    required this.row,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //* Emitting a PlayerTapped event into the stream of the bloc.
        BlocProvider.of<GameBloc>(context).add(
          PlayerTapped(column: column, row: row),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: value == "" ? getColor(value) : const Color(0xffe3e3e3),
          ),
        ),
        elevation: 1.0,
        child: Container(
          alignment: Alignment.center,
          color: getColor(value).withOpacity(0.1),
          child: Text(
            value,
            style: TextStyle(
              color: getColor(value),
              fontSize: 18.0,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
      ),
    );
  }

//* Function to get color of the cell on the basis of its value.
  Color getColor(String value) {
    return value == "O"
        ? const Color(0xff46a3ff)
        : value == "X"
            ? const Color(0xffff827e)
            : value == "#"
                ? const Color(0xffffb048)
                : Colors.white;
  }
}
