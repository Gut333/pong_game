import 'package:flutter/material.dart';

class PlayerJoystick extends StatelessWidget {
  
  double? joystickHeight;
  double? buttonSize;
  dynamic buttonLeftAction;
  dynamic buttonCenterAction;
  dynamic buttonRightAction;



  PlayerJoystick({super.key, 
    this.joystickHeight = 100,
    this.buttonLeftAction,
    this.buttonCenterAction,
    this.buttonRightAction,
    
    });



  @override
  Widget build(BuildContext context) {
    return Container(
      child: _body(),


    );
  }

  Widget _body(){
    return Container(
      height: joystickHeight ,
      width: double.infinity,
      color: Colors.pinkAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        _button(buttonLeftAction),
        _startButton(buttonCenterAction),
        _button(buttonRightAction),
        
        
      ]),


    );
  }

  Widget _button(dynamic action){

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 50,
        width: 50,
        color: Colors.amber,
        child: GestureDetector(
          onTap: action,
        ),
      ),
    );
  }

  Widget _startButton(dynamic action){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 30,
        width: 80,
        color: Colors.amber,
        child: GestureDetector(
          onTap: action,
        ),
      ),
    );
  }  




}