
import 'package:flutter/material.dart';
import 'package:sneaker_head/Admin/AddProduct.dart';
import 'package:sneaker_head/Admin/EditProduct.dart';

class AdminHome extends StatelessWidget {
  static String id = 'AdminHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => AddProduct()));
            },
            child: Text('Add Product'),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
               Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => EditProduct()));
            },
            child: Text('Edit Product'),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     //  Navigator.of(context).pushReplacement(
          //     //         MaterialPageRoute(builder: (context) => AddProduct()));
          //   },
          //   child: Text('View orders'),
          // )
        ],
      ),
    );
  }
}
