import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inchat/colors.dart';

import 'LoginScreen/login.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 4),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Image.asset('assets/Splash\ Screen.png'),
      ),
    );
  }
}