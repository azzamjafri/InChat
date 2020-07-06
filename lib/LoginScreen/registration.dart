import 'package:flutter/material.dart';
import 'package:inchat/colors.dart';
import 'package:inchat/custom_switch.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  bool enable = false;
  // false == Phone number, true = Email address

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController upiIDController = new TextEditingController();
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
        image: DecorationImage(image: AssetImage('assets/Sign\ Up.png'), fit: BoxFit.fill)
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

          Text('Your Name', style: TextStyle(color: Colors.blue)),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.4,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.grey[100],
            ),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                fillColor: greyColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0)
                ),
              ),
              
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
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
              controller: phoneController,
              decoration: InputDecoration(
                fillColor: greyColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0)
                ),
              ),
              
            ),
          ),

          Text('UPI ID', style: TextStyle(color: Colors.blue)),
          Container(
            height: 45.0,
            width: MediaQuery.of(context).size.width / 1.4,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: Colors.grey[100],
            ),
            child: TextFormField(
              controller: upiIDController,
              decoration: InputDecoration(
                fillColor: greyColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0)
                ),
              ),
              
            ),
          ),


          

          Padding(padding: EdgeInsets.only(top: 8.0, bottom: 8.0)),
          Text('Create Password', style: TextStyle(color: Colors.blue)),
         
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
              onPressed: () {},
              elevation: 10.0,
              color: blueColor,
              child: Text('Get Started', style: TextStyle(color: whiteColor, fontSize: 16.0))
            ),
          ),

         

          Padding(padding: EdgeInsets.only(top: 18.0),),
        ],
      ),
    );
  }
}