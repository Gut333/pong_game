import 'package:flutter/material.dart';
import 'package:pong_game/button_component.dart';
import 'package:pong_game/home_page.dart';
import 'package:pong_game/player_joystick_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  // double buttonLeftPositionX = -0.90;
  // double buttonLeftPositionY = 0.95;
  // double buttonRightPositionX = 0.90;
  // double buttonRightPositionY = 0.95;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(
        children: [
          Container(height: 100,color: Colors.amber,),         
          HomePage(),
          PlayerJoystick(),     
          ]),
      


    );
  }
}

