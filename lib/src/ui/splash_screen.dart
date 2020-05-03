import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xff543B7A),
          child: Center(child: Text('Splash Screen',style: TextStyle(color: Colors.white),))),
    );
  }
}