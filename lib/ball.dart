import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final x;
  final y;

  Ball({this.x , this.y});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(x,y),
      child: Container(
        height: 25,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white),
        
      ),
    );
  }
}