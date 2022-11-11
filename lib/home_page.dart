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
  double buttonLeftPositionX = -0.90;
  double buttonLeftPositionY = 0.90;
  double buttonRightPositionX = 0.90;
  double buttonRightPositionY = 0.90;

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

  void moveLeft (){
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
              Brick(x: playerX, y: 0.7),
              Ball(x: ballX , y: ballY), 
              Button(x: buttonLeftPositionX, y: buttonLeftPositionY,),
              Button(x: buttonRightPositionX, y: buttonRightPositionY,),
            ],
          ),
        ),
      ),
    );
  }


}

class Button extends StatelessWidget {
  final x ;
  final y ;

  Button({this.x , this.y});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x, y),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: Colors.red,
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}



