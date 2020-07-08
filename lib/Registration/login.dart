import 'package:flutter/material.dart';
import 'package:inchat/HomeScreen/home_screen.dart';

import 'package:inchat/colors.dart';
import 'package:inchat/custom_switch.dart';

import 'registration.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  bool enable = false;
  TextEditingController phoneNoController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: getBody(),
    );
  }
  

  getBody() {
    return Container(


      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/Sign\ In\ screen.png'), fit: BoxFit.fill)
      ),

      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // blue raiseed button
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 60.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0),
              ),
              elevation: 5.0,
              onPressed: () {},
              color: blueColor,
              child: Row(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/emoji.png',
                      color: whiteColor,
                    ),
                    height: 60.0,
                    width: 60.0,
                  ),
                  Text('Continue with Facebook',
                      style: TextStyle(color: whiteColor, fontSize: 16.0))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Phone number', style: TextStyle(fontSize: 14.0, color: (enable) ? Colors.grey : Colors.blue)),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                Container(
                  height: 23.0,
                  width: 50.0,
                  child: CustomSwitch(
                    value: enable,
                    onChanged: (bool val){
                      setState(() {
                        enable = val;
                        // print(enable);
                      });
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 10.0)),
                Text('Email Address', style: TextStyle(fontSize: 14.0, color: (enable) ? Colors.blue : Colors.grey)),
              ],
            ),
          ),

          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.4,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.grey[100],
            ),
            child: TextFormField(
              controller: phoneNoController,
              decoration: InputDecoration(
                fillColor: greyColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0)
                ),
              ),
              
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 8.0, bottom: 8.0)),

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Password', style: TextStyle(fontSize: 14.0, color: (!enable) ? Colors.grey : Colors.blue)),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                Container(
                  height: 23.0,
                  width: 50.0,
                  child: CustomSwitch(
                    value: !enable,
                    onChanged: (bool val){
                      setState(() {
                        enable = val;
                        // print(enable);
                      });
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 10.0)),
                Text('OTP via SMS', style: TextStyle(fontSize: 14.0, color: (!enable) ? Colors.blue : Colors.grey)),
              ],
            ),
          ),

          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.4,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.grey[100],
            ),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                fillColor: greyColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0)
                ),
              ),
              
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 8.0, bottom: 8.0)),


          Container(
            
            width: MediaQuery.of(context).size.width / 2.4,
            height: 45.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              elevation: 10.0,
              color: blueColor,
              child: Text('Confirm', style: TextStyle(color: whiteColor, fontSize: 16.0))
            ),
          ),

          Text('Forgot Password ? ', style: TextStyle(fontSize: 14.0, color: Colors.blue, letterSpacing: 0.7)),

          Padding(padding: EdgeInsets.only(top: 35.0),),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen())),
                      child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New User? ', style: TextStyle(color: greyColor, fontSize: 16.5)),
                Text('Sign Up! ', style: TextStyle(color: Colors.blue, fontSize: 16.5)),
              ],
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 40.0),),
        ],
      ),
    );
  }
}

