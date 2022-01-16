import 'package:flutter/material.dart';
import 'package:sneaker_head/FireBase_Service/Firebase_Service.dart';
import 'package:sneaker_head/Custom/Custom.dart';
import 'package:sneaker_head/Screens/SignIn_Screen.dart';
import 'package:sneaker_head/Screens/SignUp_screen.dart';
import '../Colors.dart';

class ForgotPassword extends StatefulWidget {
  TextEditingController email = TextEditingController();
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: Text('Forgot Password', style: TextStyle(color: Colors.white)),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios, color: bgColor),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ));
              },
            );
          })),
      body: SingleChildScrollView(
        child: Container(
          color: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 60),
              Image.asset('assets/image2.png', width: 100, height: 100),
              SizedBox(height: 10),
              Text(
                'Forgot Password ?',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Enter your email to recover your password',
                      style:
                          TextStyle(fontWeight: FontWeight.w100, fontSize: 15),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(children: [
                            Custom('Enter your email', widget.email),
                            SizedBox(height: 20),
                            SizedBox(height: 30),
                            _materialButton(),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('''Don't have an account?'''),
                                signUP(),
                              ],
                            ),
                          ])),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _materialButton() {
    return Material(
      //Wrap with Material
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0.0,
      color: Colors.red,
      clipBehavior: Clip.antiAlias, // Add This
      child: MaterialButton(
        minWidth: 400.0,
        height: 50,
        color: btnColor,
        child: new Text('Reset Password',
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: () {
          print("email : ${widget.email.text}");
          AuthenticationService()
              .resetPassword(email: widget.email.text.trim())
              .then((value) => {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SignIn()))
                  });
        },
      ),
    );
  }

  Widget signUP() {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUp(),
              ));
        },
        child: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 15,
            color: Colors.red,
          ),
        ));
  }
}
