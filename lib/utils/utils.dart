enum Player { Player1, Player2, Player3 }

//* This will map each player to its symbol
var mapPlayerToSign = {
  Player.Player1: "O",
  Player.Player2: "X",
  Player.Player3: "#",
};

int rowSize = 5;
int columnSize = 6;
int gridSize = rowSize * columnSize;
