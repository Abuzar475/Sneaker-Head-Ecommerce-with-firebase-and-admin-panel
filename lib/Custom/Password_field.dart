import 'package:flutter/material.dart';

class PasswordCustom extends StatelessWidget {
  String name;
  TextEditingController email;
  TextEditingController secondTextController;
  PasswordCustom(this.name, this.email, {this.secondTextController});
  @override
  Widget build(BuildContext context) {
    return _password(this.name, this.email);
  }

  Widget _password(String name, TextEditingController email) {
    return TextFormField(
      controller: email,
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      validator: (String value) {
        if (secondTextController != null) {
          //Re-Password validation
          if (secondTextController.text != email.text)
            return "Enter same password";
          return null;
        } else {
          if (value.isEmpty) {
            return 'Please Enter $name';
          }
          return null;
        }
      },
      onSaved: (String value) {
        name = value;
      },
      style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          fontWeight: FontWeight.w300),
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.all(20),
          hintText: "$name",
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(10.0))),
    );
  }
}
