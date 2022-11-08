import 'package:flutter/material.dart';

class ToPlayScreen extends StatelessWidget {
  final bool gameHasStarted;

   ToPlayScreen({required this.gameHasStarted});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, -0.2),
      child:  Text(
        gameHasStarted ? '' : 'TAP TO PLAY',
      style: const TextStyle(color: Colors.white),),
    );
  }
}

