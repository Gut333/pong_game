import 'package:flutter/material.dart';

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