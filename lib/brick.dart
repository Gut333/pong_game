// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Brick extends StatelessWidget {
  final x;
  final y;
  final brickWidth;

  Brick({this.x, this.y, this.brickWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2*x + brickWidth) / (2 - brickWidth), y),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          height: 20,
          width: MediaQuery.of(context).size.width / 5,
        ),
      ),
    );
  }
}
