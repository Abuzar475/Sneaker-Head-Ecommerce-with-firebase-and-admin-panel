import 'package:flutter/material.dart';
import 'package:sneaker_head/Colors.dart';
import 'package:sneaker_head/FireBase_Service/Firebase_Service.dart';
import 'package:sneaker_head/Product_Pages.dart/Product.dart';
import 'package:sneaker_head/Custom/Custom.dart';
import 'package:sneaker_head/Screens/Forgot_Password.dart';
import 'package:sneaker_head/Screens/SignUp_screen.dart';
import 'package:sneaker_head/Screens/adminSignin.dart';


class SignIn extends StatefulWidget {
  TextEditingController email = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: bgColor,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios, color: bgColor),
              onPressed: () {},
            );
          })),
      body: Container(
        color: bgColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 60),
              Image.asset('assets/image2.png', width: 100, height: 100),
              SizedBox(height: 10),
              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Hello there, sign in to continue',
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
                            Custom('User Name', widget.email),
                            SizedBox(height: 20),
                            _password(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                forgotPassword(),
                              ],
                            ),
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
                            admin(),
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

  // Widget _email() {
  //   return TextField(
  //     cursorColor: Colors.black,
  //     keyboardType: TextInputType.emailAddress,
  //     obscureText: false,
  //     style: TextStyle(
  //         fontFamily: 'Montserrat',
  //         fontSize: 15.0,
  //         fontWeight: FontWeight.w300),
  //     decoration: InputDecoration(
  //         fillColor: Colors.white,
  //         filled: true,
  //         contentPadding: EdgeInsets.all(20),
  //         hintText: "User Name",
  //         border: OutlineInputBorder(
  //             borderSide: const BorderSide(color: Colors.white, width: 0.0),
  //             borderRadius: BorderRadius.circular(10.0))),
  //   );
  // }

  Widget _password() {
    //TextEditingController pass;
    return TextField(
      controller: widget.passwordController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          fontWeight: FontWeight.w300),
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.all(20),
          hintText: "Password",
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(10.0))),
    );
  }

  Widget _materialButton() {
    //print("Email : $email password : $password");
    return Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 0.0,
        color: Colors.red,
        clipBehavior: Clip.antiAlias, // Add This
        child: MaterialButton(
            minWidth: 400.0,
            height: 50,
            color: btnColor,
            child: new Text('Login',
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: () {
              print(
                  "email :${widget.email} password ${widget.passwordController.text}");
              AuthenticationService()
                  .signIn(
                email: widget.email.text.trim(),
                password: widget.passwordController.text.trim(),
              )
                  .then((value) {
                if (value) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ProductPage()));
                } else {
                  var snackBar =
                      SnackBar(content: Text('Credentials Not Matched'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
            }));
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

    Widget admin() {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminLogin(),
              ));
        },
        child: Text(
          'Admin Log In',
          style: TextStyle(
            fontSize: 15,
            color: Colors.red,
          ),
        ));
  }

  Widget forgotPassword() {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForgotPassword(),
              ));
        },
        child: Text('Forgot Password',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)));
  }

  
}
