import 'package:flutter/material.dart';
import 'package:sneaker_head/Screens/Splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sneaker_head/provider/adminMode.dart';
import 'package:sneaker_head/provider/cartItem.dart';
import 'package:sneaker_head/provider/modelHud.dart';
import 'package:provider/provider.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ModelHud>(
      create: (context) => ModelHud(),
    ),
    ChangeNotifierProvider<CartItem>(
      create: (context) => CartItem(),
    ),
    ChangeNotifierProvider<AdminMode>(
      create: (context) => AdminMode(),
    )
  ], child: MaterialApp(debugShowCheckedModeBanner: false, home: MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SplashSreeen(),
          ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          brightness: Brightness.dark),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/splash.png'),
                      width: 200,
                      height: 200,
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
