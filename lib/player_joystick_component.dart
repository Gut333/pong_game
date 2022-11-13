import 'package:flutter/material.dart';
import 'package:pong_game/button_component.dart';

class PlayerJoystick extends StatelessWidget {
  



  @override
  Widget build(BuildContext context) {
    return Container(
      child: _body(),


    );
  }

  Widget _body(){
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.pinkAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        _button(),
        _startButton(),
        _button(),
        
        
      ]),


    );
  }

  Widget _button(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 50,
        width: 50,
        color: Colors.amber,
      ),
    );
  }

  Widget _startButton(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 30,
        width: 80,
        color: Colors.amber,
      ),
    );
  }  




}