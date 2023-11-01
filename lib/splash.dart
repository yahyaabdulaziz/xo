import 'package:flutter/material.dart';
import 'package:xo/gameboard.dart';
import 'package:xo/gameboardarg.dart';

class Splash extends StatelessWidget {
  static const String routeName = "Splash";

  TextEditingController player1cont = TextEditingController();
  String player2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/xo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    controller: player1cont,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    decoration: const InputDecoration(
                        hintText: "Enter Player 1 Name",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 18)),
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (text) {
                      player2 = text;
                    },
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    decoration: const InputDecoration(
                        hintText: " Enter Player 2 Name ",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 18)),
                  )),
              Spacer(),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 200, right: 10, left: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        /// if text fields is empty
                        if (player1cont.text.isEmpty && player2.isEmpty) {
                          player1cont.text = "player1";
                          player2 = "player2";
                        }
                        Navigator.pushNamed(context, GameBoard.routeName,
                            arguments: GameBoardArg(player1cont.text, player2));
                      },
                      child: const Text(
                        "Start New Game",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
