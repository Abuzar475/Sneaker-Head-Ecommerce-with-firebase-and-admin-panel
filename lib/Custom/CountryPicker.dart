import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class CustomCountry extends StatelessWidget {
  String name;
  TextEditingController country;
  TextEditingController secondTextController;
  CustomCountry(this.name, this.country,{this.secondTextController});
  @override
  Widget build(BuildContext context) {
    return _email(this.name, this.country);
  }

  Widget _email(String name, TextEditingController email) {
    return TextFormField(
      controller: email,
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
       validator: (String value){
                  
                      if(value.isEmpty)
                      {
                        return 'Please Enter $name';
                      }
                      return null;
                    }
              ,
                    onSaved: (String value){
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
