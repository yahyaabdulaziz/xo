import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  String digit;
  Function onClick;
  int index;
  GameButton({required this.digit, required this.onClick,required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
            onPressed: () {
              onClick(index);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.amber)), // Here Im having the error
            child: Text(digit,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}
