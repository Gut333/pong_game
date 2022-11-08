import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pong_game/ball.dart';
import 'package:pong_game/brick.dart';
import 'package:pong_game/to_play_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double ballX = 0;
  double ballY = 0;

  
  bool gameHasStarted = false;


  void startGame(){
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 1), (timer) { 
      setState(() {
        ballY += 0.01;

        
      });
      

    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Stack(
            children: [
              ToPlayScreen(gameHasStarted: gameHasStarted,),
              Brick(x: 0, y: -0.9),
              Brick(x: 0, y: 0.9),
              Ball(x: 0, y: 0), 
            ],
          ),
        ),
      ),
    );
  }
}
