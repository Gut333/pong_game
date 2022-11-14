// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pong_game/ball_component.dart';
import 'package:pong_game/brick_component.dart';
import 'package:pong_game/player_joystick_component.dart';
import 'package:pong_game/to_play_screen.dart';


class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

enum Direction { UP, DOWN, LEFT, RIGHT}

class _HomePageState extends State<HomePage> {
  bool gameHasStarted = false;
  double playerX = -0.2;
  double playerWidth = 0.4;
  double enemyX = -0.2;
  double ballX = 0;
  double ballY = 0;
  var ballYDirection = Direction.DOWN;
  var ballXDirection = Direction.LEFT;

  double enemyBrickPositionY = -0.9;
  double playerBrickPositionY = 0.9;

  void startGame(){
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 3), (timer) { 
      setState(() {
        updateDirection();
        moveBall();
        enemyMovement();
        //automaticPlayerMovement();       
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
    });
  }

  bool isEnemyDead(){
      if(ballY >= -1){
        return true;
      }
      return false;
  }


  bool isPlayerDead(){
      if(ballY >= 1){
        return true;
      }
      return false;
  }

    void enemyMovement () {
      setState(() {
        enemyX = ballX;
      });
  }

    void automaticPlayerMovement () {
      setState(() {
        playerX = ballX ;
      });

  }



  void updateDirection (){
      setState(() {
        if (ballY >= 0.9 && playerX + playerWidth >= ballX && playerX <= ballX){
          ballYDirection = Direction.UP;
        } else if (ballY <= -0.9){
          ballYDirection = Direction.DOWN;
        }

        if(ballX >= 1){
          ballXDirection = Direction.LEFT;
        } else if (ballX <= -1.0){
          ballXDirection = Direction.RIGHT;
        }

      });

  }

  void moveBall (){
      setState(() {
        if (ballYDirection == Direction.DOWN) {
          ballY += 0.01 ;

        } else if (ballYDirection == Direction.UP){
          ballY -= 0.01;
        }
        if(ballXDirection == Direction.LEFT){
          ballX -= 0.01 ;

        } else if (ballXDirection == Direction.RIGHT){
          ballX += 0.01;
        }

      });
  }


  void playerMoveLeft (){
      setState(() {
        playerX -= 0.2;
        if(playerX < -1){
          playerX = -1 ;
        }
      });
    }


  void playerMoveRight (){
      setState(() {
        playerX += 0.2;
        if(playerX > 0.7){
          playerX = 0.6;
        }
      });
    }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    //ToPlayScreen(gameHasStarted: gameHasStarted,startGame: startGame,),
                    Brick(x: enemyX, y: enemyBrickPositionY, brickWidth: playerWidth),
                    Brick(x: playerX, y: playerBrickPositionY, brickWidth: playerWidth),
                    Ball(x: ballX , y: ballY), 
                    _brickReferenceTest(),
                  ],
              
                ),
              ),
              PlayerJoystick(
                buttonLeftAction: playerMoveLeft,
                buttonCenterAction: startGame,
                buttonRightAction: playerMoveRight,),
            ],
          ),
        ),
      ),
    );
  }



  Widget _brickReferenceTest(){
    return Container(
            alignment: Alignment(enemyX,enemyBrickPositionY),
              child: Container(
                width: 2,
                height: 20,
                color: Colors.red,
              ),
            );
  }

}
