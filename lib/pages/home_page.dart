import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/game_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
//* List of rules for the game
  final rules = const [
    "1. There will be 3 players in the game.",
    "2. Each Player is represented using a symbol.",
    "   • Player1 is represented as O.",
    "   • Player2 is represented as X.",
    "   • Player3 is represented as #.",
    "3. Wherever a player taps, then we mark that cell as captured by player.",
    "4. Whenever a player captures three consecutive boxes, be it in a row, in a column or diagonally. \nThat Player wins the match.",
    "5. If none of the player is able to do it so, then that game ends in a draw."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Rules',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5.0,
                  ),
                  itemBuilder: (context, index) => Text(
                    rules[index],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  itemCount: rules.length,
                  shrinkWrap: true,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const GamePage(),
                      ),
                    );
                  },
                  color: Colors.black,
                  child: const Text(
                    "Start the game",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
