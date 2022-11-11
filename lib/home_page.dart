import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pong_game/ball.dart';
import 'package:pong_game/brick.dart';
import 'package:pong_game/to_play_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

enum direction { UP, DOWN }

class _HomePageState extends State<HomePage> {
  bool gameHasStarted = false;
  double playerX = 0;
  double ballX = 0;
  double ballY = 0;

  var ballDirection = direction.DOWN;
  double joystickPosition = -1 ;

  void startGame(){
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 4), (timer) { 
      setState(() {
        updateDirection();
        moveBall();

      });
      

    });
  }


  void updateDirection (){
    setState(() {
      if (ballY >= 0.9){
        ballDirection = direction.UP;
      } else if (ballY <= -0.9){
        ballDirection = direction.DOWN;
      }
    });

  }

  void moveBall (){
    setState(() {
      if (ballDirection == direction.DOWN) {
        ballY += 0.01 ;
      } else if (ballDirection == direction.UP){
        ballY -= 0.01;
      }
    });
  }

  void moveLeft (double x){
    setState(() {
      playerX -= 0.01;

    });
  }

  void moveRight (){
    setState(() {
      playerX += 0.01;

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
              Brick(x: playerX, y: 0.9),
              Ball(x: ballX , y: ballY), 
            ],
          ),
        ),
      ),
    );
  }


}



