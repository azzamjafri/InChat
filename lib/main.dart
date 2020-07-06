import 'package:flutter/material.dart';
import 'package:inchat/colors.dart';
import 'package:inchat/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'In Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: blueColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

