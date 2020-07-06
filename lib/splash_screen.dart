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
      Duration(seconds: 6),
      // () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
      () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset('assets/Splash\ Screen.png', fit: BoxFit.cover),
    );
  }
}