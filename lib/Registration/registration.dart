import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String message;
  final formKey = GlobalKey<FormState>();
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

      
      child: Form(
        key: formKey,
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
                validator: (value) {
                  return (value.isEmpty) ? 'Name Can\'t be empty' : null;
                },
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
                validator: (value) {
                  if(enable){
                    return (value.length == 0) ? 'Enter Email' : null;
                  }else{
                    return (value.length != 10) ? 'Enter a valid number' : null;
                  }
                },
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
                validator: (value) => (value.length == 0) ? 'Enter UPI ID' : null,
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
                validator: (value) => (value.length < 8) ? 'Password should be atleast 8 characters long' : null,
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
                  if(formKey.currentState.validate()){
                    formKey.currentState.save();
                    register(nameController.text.trim(), phoneController.text.trim(), upiIDController.text.trim(), passwordController.text.trim());
                  }
                  
                },
                elevation: 10.0,
                color: blueColor,
                child: Text('Get Started', style: TextStyle(color: whiteColor, fontSize: 16.0))
              ),
            ),

           

            Padding(padding: EdgeInsets.only(top: 18.0),),
          ],
        ),
      ),
    );
  }

  register(name, email, upiID, password) async {

    AuthResult authResult;
    try{
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await Firestore.instance.collection('users').document(authResult.user.uid).setData({
        'email' : email,
        'name' : name,
        'upiId': upiID,
      });

      // Navigator.push(context, route);
    } on PlatformException catch (error) {
      message = 'An error occured, please check credentials';
      if(error.message != null) {message = error.message;}

      // Alert(
      //   context: context,
      //   type: AlertType.error,
      //   title: "Error",
      //   buttons: [
      //     DialogButton(
      //       child: Text(
      //         message,
      //         style: TextStyle(color: Colors.white, fontSize: 15),
      //       ),
      //       onPressed: () async {
      //         Navigator.pop(context);
      //       },
      //     )
      //   ],
      // ).show();
    } catch(error) {
      print(error.toString() + ' ****************************');
    }
    
  }
}