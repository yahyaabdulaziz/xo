import 'package:xo/gameboardarg.dart';
import 'game_button.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  static const String routeName = "GameBoard";

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> board = ["", "", "", "", "", "", "", "", ""];
  int counter = 0;
  int player1score = 0;
  int player2score = 0;

  @override
  Widget build(BuildContext context) {
    GameBoardArg arg =
        ModalRoute.of(context)!.settings.arguments as GameBoardArg;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(" XO Game ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {
              resetboard();
              player1score = 0;
              player2score = 0;
              counter = 0;
            },
            icon: const Icon(
              Icons.cleaning_services_sharp,
              color: Colors.amber,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black12,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${arg.player1} : $player1score",
                    style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("${arg.player2} : $player2score",
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(digit: board[0], onClick: onButtonClick, index: 0),
                GameButton(digit: board[1], onClick: onButtonClick, index: 1),
                GameButton(digit: board[2], onClick: onButtonClick, index: 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(digit: board[3], onClick: onButtonClick, index: 3),
                GameButton(digit: board[4], onClick: onButtonClick, index: 4),
                GameButton(digit: board[5], onClick: onButtonClick, index: 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(digit: board[6], onClick: onButtonClick, index: 6),
                GameButton(digit: board[7], onClick: onButtonClick, index: 7),
                GameButton(digit: board[8], onClick: onButtonClick, index: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onButtonClick(int index) {
    if (board[index].isNotEmpty) return;
    String symbol = counter % 2 == 0 ? "X" : "O";
    board[index] = symbol;
    counter++;
    if (checkWinner(symbol)) {
      if (symbol == "X")
        player1score++;
      else
        player2score++;

      resetboard();
      return;
    }

    if (counter == 9) {
      resetboard();
    }
    setState(() {});
  }

  void resetboard() {
    board = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    setState(() {});
  }

  bool checkWinner(String symbol) {
    /// steps for rows
    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == symbol &&
          symbol == board[i + 1] &&
          symbol == board[i + 2]) {
        return true;
      }
    }

    /// steps for columns
    for (int i = 0; i <= 2; i++) {
      if (board[i] == symbol &&
          symbol == board[i + 3] &&
          symbol == board[i + 6]) {
        return true;
      }
    }

    /// steps for diagonals
    if (board[0] == symbol && symbol == board[4] && symbol == board[8]) {
      return true;
    } else if (board[2] == symbol && symbol == board[4] && symbol == board[6]) {
      return true;
    }

    return false;
  }
}
