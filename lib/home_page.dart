import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pong_game/ball.dart';
import 'package:pong_game/brick.dart';
import 'package:pong_game/to_play_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

enum direction { UP, DOWN, LEFT, RIGHT}

class _HomePageState extends State<HomePage> {
  bool gameHasStarted = false;
  double playerX = 0;
  double playerWidth = 0.4;

  double ballX = 0;
  double ballY = 0;
  var ballYDirection = direction.DOWN;
  var ballXDirection = direction.LEFT;
  


  double buttonLeftPositionX = -0.90;
  double buttonLeftPositionY = 0.90;
  double buttonRightPositionX = 0.90;
  double buttonRightPositionY = 0.90;

  void startGame(){
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) { 
      setState(() {
        updateDirection();
        moveBall();
        
        if(isPlayerDead()){
          timer.cancel();
          resetGame();
        }

      });
      

    });
  }

  void resetGame(){
    setState(() {
      gameHasStarted = false;
      ballX = 0;
      ballY = 0;
      //playerX = -0.2;

    });

  }


  bool isPlayerDead(){
    if(ballY >= 1){
      return true;
    }

    return false;

  }

  void updateDirection (){
    setState(() {
      if (ballY >= 0.7 && playerX + playerWidth >= ballX && playerX <= ballX){
        ballYDirection = direction.UP;
      } else if (ballY <= -0.9){
        ballYDirection = direction.DOWN;
      }


      if(ballX >= 1){
        ballXDirection = direction.LEFT;
      } else if (ballX <= -1.0){
        ballXDirection = direction.RIGHT;
      }

    });

  }



  void moveBall (){
    setState(() {
      if (ballYDirection == direction.DOWN) {
        ballY += 0.01 ;
      } else if (ballYDirection == direction.UP){
        ballY -= 0.01;
      }
      if(ballXDirection == direction.LEFT){
        ballX -= 0.01 ;

      } else if (ballXDirection == direction.RIGHT){
        ballX += 0.01;
      }

    });
  }





  void moveLeft (){
    setState(() {
      playerX -= 0.2;

    });
  }

  void moveRight (){
    setState(() {
      playerX += 0.2;

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Stack(
          children: [
            ToPlayScreen(gameHasStarted: gameHasStarted,startGame: startGame,),
            Brick(x: 0, y: -0.9, brickWidth: playerWidth,),
            Brick(x: playerX, y: 0.7, brickWidth: playerWidth,),
            Ball(x: ballX , y: ballY), 
            Container(
              alignment: Alignment(playerX,0.7),
              child: Container(
                width: 2,
                height: 20,
                color: Colors.red,
              ),
            ),
            Button(x: buttonLeftPositionX, y: buttonLeftPositionY,onTapp: moveLeft,),
            Button(x: buttonRightPositionX, y: buttonRightPositionY,onTapp: moveRight,),
          ],
        ),
      ),
    );
  }


}

class Button extends StatelessWidget {
  final x ;
  final y ;
  dynamic onTapp;

  Button({this.x , this.y , this.onTapp});

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
          child: GestureDetector(
            onTap: onTapp,
          ),
        ),
      ),
    );
  }
}



