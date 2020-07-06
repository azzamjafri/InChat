import 'package:flutter/material.dart';

Map<int, Color> colors = {
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};


MaterialColor blueColor = MaterialColor( 0xff1B8AC2, colors);
MaterialColor whiteColor = MaterialColor(0xffF9FBFC, colors);
MaterialColor redColor = MaterialColor(0xffC41E55, colors);
MaterialColor greenColor= MaterialColor(0xff3AB54A, colors);
MaterialColor pinkColor = MaterialColor(0xffF15B5B, colors);
MaterialColor blackColor = MaterialColor(0xff050505, colors);
MaterialColor greyColor = MaterialColor(0xffBCBBB7, colors);


TextStyle roboto = new TextStyle(fontFamily: 'Roboto');