import 'package:flutter/material.dart';
import 'package:pong_game/ball.dart';
import 'package:pong_game/brick.dart';
import 'package:pong_game/to_play_screen.dart';

class HomePage extends StatelessWidget {
  bool gameHasStarted = false;
  
  void startGame(){
    
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
              ToPlayScreen(),
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
