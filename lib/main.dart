import 'package:flutter/material.dart';
import 'package:xo/gameboard.dart';
import 'package:xo/splash.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      Splash.routeName: (_) => Splash(),
      GameBoard.routeName: (_) => GameBoard(),
    },
    initialRoute: Splash.routeName,
  ));
}
