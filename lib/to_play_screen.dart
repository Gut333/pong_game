import 'package:flutter/material.dart';

class ToPlayScreen extends StatelessWidget {
  final bool gameHasStarted;
  dynamic startGame;

   ToPlayScreen({required this.gameHasStarted,this.startGame});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, -0.1),
      child: Container(
            height: 30,
            width: 100,
            color: Colors.transparent ,
            child: Center(
              child: GestureDetector(
                onTap: startGame,
                child: Text(gameHasStarted ? ' ': 'TAP TO PLAY',style: const TextStyle(color: Colors.white),),
              ),
            ),
          ),          
    );
  }
}
