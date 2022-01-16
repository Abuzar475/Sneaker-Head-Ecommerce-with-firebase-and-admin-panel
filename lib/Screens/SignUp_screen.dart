import 'package:flutter/material.dart';
import 'package:sneaker_head/Colors.dart';
import 'package:sneaker_head/Custom/Password_field.dart';
import 'package:sneaker_head/FireBase_Service/Firebase_Service.dart';
import 'package:sneaker_head/Product_Pages.dart/Product.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:sneaker_head/Custom/Custom.dart';
import 'package:sneaker_head/Screens/SignIn_Screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUp extends StatefulWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController repassword = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController name = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: Text('Sign Up', style: TextStyle(color: Colors.white)),
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
      body: Container(
        color: bgColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: widget._formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                Text(
                  'Create New Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Create an account to continue !',
                        style: TextStyle(
                            fontWeight: FontWeight.w100, fontSize: 15),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(children: [
                              Custom('User Name', widget.name),
                              SizedBox(height: 20),
                            phoneAuth(),
                             SizedBox(height: 20),
                              Custom('Email Address', widget.email),
                              SizedBox(height: 20),
                              PasswordCustom('Password', widget.password),
                              SizedBox(height: 20),
                              PasswordCustom('Confirm Password', widget.repassword,
                                  secondTextController: widget.password),
                              SizedBox(height: 20),
                              Custom('Enter Date of Birth', widget.dob),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'By accepting you are agree to our Terms and Conditions',
                                      // maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              _materialButton(),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Already have an account?'),
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
      ),
    );
  }

  Widget _materialButton() {
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
            child: new Text('Create Account',
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: () {
              if (widget._formkey.currentState.validate()) {
                print("Successfull");
              } else {
                print("UnSuccessfull");
              }
              print("email : ${widget.email.text}");
              AuthenticationService()
                  .signUp(
                email: widget.email.text.trim(),
                password: widget.password.text.trim(),
                dob: widget.dob.text.trim(),
                phone: widget.country.text.trim(),
                userName: widget.name.text.trim(),
                
              )
                  .then((value) {
                if (value) {
                  print('value is true');
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ProductPage()));
                } else {
                  print('value is false');
                  var snackBar =
                      SnackBar(content: Text('Please fill the form correclty'));
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
                builder: (context) => SignIn(),
              ));
        },
        child: Text(
          'Sign In',
          style: TextStyle(
            fontSize: 15,
            color: Colors.red,
          ),
        ));
  }

  // Widget countryPicker(String name){
  //   CountryCodePicker(
  //               // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
  //               initialSelection: 'UAE',
  //               favorite: ['+39','FR'],
  //               // optional. Shows only country name and flag
  //               showCountryOnly: false,
  //               // optional. Shows only country name and flag when popup is closed.
  //               showOnlyCountryWhenClosed: false,
  //               // optional. aligns the flag and the Text left
  //               alignLeft: false,
  //             );
  // }
  Widget phoneAuth(){
  return  IntlPhoneField(
    controller: widget.country,
    keyboardType: TextInputType.number,

    validator: (String value){
                  
                      if(value.isEmpty)
                      {
                        return 'Please Enter Phone Number';
                      }
                      return null;
                    },
                    // onSaved: (String value){
                    //   name = value;
                    // },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                   initialCountryCode: 'IN',
  );
  
  }

}
