import 'package:flutter/material.dart';
import 'package:sneaker_head/Colors.dart';
import 'package:sneaker_head/Product_Pages.dart/product.dart';
import 'package:sneaker_head/Screens/SignIn_Screen.dart';

class SplashSreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/image1.png',
                width: 300,
                height: 300,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'SNEAKER SCAN TOOL FOR INSTANT MARKET VALUE',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'SneakerHead Xchange is a real-time market price evaluator. Powerful scan lens for sneaker recognition and fair market pricing. Gathering public data from the major markets of new authentic sneaker shoe purchases and sells. Giving the user the overall average price from the sneaker resell market to assist in their investment decision instantly',
                      textAlign: TextAlign.center,
                      maxLines: 9,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    minWidth: 200.0,
                    height: 35,
                    color: btnColor,
                    child: new Text('GET STARTED',
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                  ),
                  SizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
