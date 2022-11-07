import 'package:flutter/material.dart';

class ToPlayScreen extends StatelessWidget {
  final x;
  final y;

   ToPlayScreen({this.x , this.y});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, -0.2),
      child: const Text('TAP TO PLAY',
      style: TextStyle(color: Colors.white),),
    );
  }
}

