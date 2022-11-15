import 'package:flutter/material.dart';

class PlayerJoystick extends StatelessWidget {
  
  double? joystickHeight;
  double? buttonSize;
  dynamic buttonLeftAction;
  dynamic buttonCenterAction;
  dynamic buttonRightAction;

  final bool gameHasStarted;



  PlayerJoystick({super.key, 
    this.joystickHeight = 80,
    this.buttonLeftAction,
    this.buttonCenterAction,
    this.buttonRightAction,
    required this.gameHasStarted,
    
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
      color: Colors.black45,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: 40,
          width: 40,
          color: Colors.redAccent,
          child: GestureDetector(
            onTap: action,
          ),
        ),
      ),
    );
  }

  Widget _startButton(dynamic action){
    if(gameHasStarted == false) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          color: Colors.amber,
          height: 25,
          width: 70,  
          child: GestureDetector(
            onTap: action,
            child:  const Center(
              child: Text('START',
              style:  TextStyle(
                letterSpacing: 0.5,
                fontSize: 12,
                fontWeight: FontWeight.bold),
                ),
                ),
          ),
        ),
      ),
    );
    }
    else {
      return const SizedBox(
    );
    }

  }  

}